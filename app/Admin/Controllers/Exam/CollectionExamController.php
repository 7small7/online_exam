<?php
declare(strict_types=1);

namespace App\Admin\Controllers\Exam;


use App\Admin\Actions\Exam\CollectionExamBatchBind;
use App\Admin\Actions\Exam\CollectionExamBind;
use App\Admin\Actions\Exam\ShowDetail;
use App\Admin\Controllers\BaseController;
use App\Models\Admin\Exam\Collection;
use App\Models\Admin\Exam\CollectionExam;
use App\Models\Admin\Exam\Exam;
use Encore\Admin\Grid;
use Illuminate\Support\Facades\Request;

/**
 * 试卷
 *
 * Class CollectionExamController
 * @package App\Admin\Controllers\Exam
 */
class CollectionExamController extends BaseController
{
    protected $title = '试卷试题';

    public function __construct(Exam $collectionExam)
    {
        $this->model = $collectionExam;
    }

    public function grid()
    {
        $grid = new Grid($this->model);
        /** @var string $collectionId 试卷uuid */
        $collectionId = Request::instance()->get('collection_id');
        /** @var object $collectionItems 试卷信息 */
        $collectionItems = Collection::query()->where([
            ['uuid', '=', $collectionId]
        ])->first(['exam_category_uuid', 'title']);

        $grid->model()->with(['examCategory:exam_item_uuid,exam_category_uuid'])
            ->where([['is_show', '=', 1]])
            ->whereHas('examCategory', function ($query) use ($collectionItems) {
                $query->where('exam_category_uuid', '=', $collectionItems->exam_category_uuid);
            })->select(['title', 'id', 'uuid'])->orderByDesc('id');

        $grid->column('collection_title', '试卷名称')->display(function () use ($collectionItems) {
            return $collectionItems->title;
        });
        $grid->column('id', '数据编号')->copyable();

        $grid->column('uuid', '试题编号')->copyable();
        $grid->column('collection_uuid', '试卷UUID')->display(function () use ($collectionId) {
            return $collectionId;
        })->copyable();
        $grid->column('title', '题干');
        $grid->column('is_bind', '是否绑定')->display(function () use ($collectionId) {
            $bean = CollectionExam::query()->where([
                ['exam_item_uuid', '=', $this->uuid],
                ['exam_collection_uuid', '=', $collectionId]
            ])->first(['id']);
            if (!empty($bean)) {
                return "<span class='label bg-green'>已绑定<span>";
            } else {
                return "<span class='label bg-red'>未绑定<span>";
            }
        });

        $grid->filter(function ($filter) {
            $filter->disableIdFilter();
            $filter->column(1 / 2, function ($filter) {
                $filter->like('uuid', '试题编号');
                $filter->like('title', '试题题干');
                $filter->equal('is_show', '启用状态')->select($this->status);
            });
        });

        $grid->batchActions(function ($batch) {
            $batch->add(new CollectionExamBatchBind());
        });

        $grid->actions(function ($actions) {
            $actions->add(new ShowDetail());
            $actions->add(new CollectionExamBind());
            $actions->disableView();
            $actions->disableEdit();
            $actions->disableDelete();
        });

        $grid->disableCreateButton();

        return $grid;
    }
}
