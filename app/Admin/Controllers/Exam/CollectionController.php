<?php


namespace App\Admin\Controllers\Exam;


use App\Admin\Actions\Exam\CollectionExam;
use App\Admin\Controllers\BaseController;
use App\Libs\UUID;
use App\Models\Admin\Exam\Category;
use App\Models\Admin\Exam\Collection;
use App\Models\Admin\Exam\Tag;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

/**
 * 试卷
 *
 * Class CollectionController
 * @package App\Admin\Controllers\Exam
 */
class CollectionController extends BaseController
{
    protected $title = '试卷管理';

    public function __construct(Collection $collection)
    {
        $this->model = $collection;
    }

    public function grid()
    {
        $grid   = new Grid($this->model);
        $status = $this->status;

        $grid->column('id', '数据编号')->sortable();
        $grid->column('uuid', '试卷编号')->copyable();
        $grid->column('title', '试卷标题')->editable();
        $grid->column('category.title', '试卷分类');
        $grid->column('tag.title', '试卷知识点');
        $grid->column('exam_time', '答题时间');
        $grid->column('number', '绑定试题数')->display(function () {
            return \App\Models\Admin\Exam\CollectionExam::query()->where([['exam_collection_uuid', '=', $this->uuid]])->count('id');
        });
        $grid->column('cover', '封面图片')->lightbox($this->imageStyle);
        $grid->column('is_show', '显示状态')->display(function ($isShow) use ($status) {
            $text = $status[$isShow];
            if ($isShow == 0) {
                return "<span class='label bg-red'>{$text}</span>";
            } elseif ($isShow == 1) {
                return "<span class='label bg-green'>{$text}</span>";
            } else {
                return '异常';
            }
        });
        $grid->column('is_recommend', '是否推荐')->display(function ($isShow) use ($status) {
            $text = $status[$isShow];
            if ($isShow == 0) {
                return "<span class='label bg-red'>{$text}</span>";
            } elseif ($isShow == 1) {
                return "<span class='label bg-green'>{$text}</span>";
            } else {
                return '异常';
            }
        });
        $grid->column('level', '难易等级')->display(function ($starLeave) {
            $str = '';
            for ($i = 1; $i <= $starLeave; $i++) {
                $str .= '<span class="star"> <i class="glyphicon glyphicon-star-empty"></i></span>';
            }
            return '<div class="rating-stars"><span class="empty-stars">' . $str . '</span></div>';
        });
        $grid->model()->orderByDesc($this->model->getKeyName());

        $grid->filter(function ($filter) {
            $filter->disableIdFilter();
            $filter->column(1 / 2, function ($filter) {
                $filter->like('title', '试卷标题');
            });
            $filter->column(1 / 2, function ($filter) {
                $filter->equal('is_show', '启用状态')->select($this->status);
            });
            $filter->column(1 / 2, function ($filter) {
                $filter->equal('exam_category_uuid', '试卷类型')->select(Category::getList());
            });
            $filter->column(1 / 2, function ($filter) {
                $filter->equal('exam_tag_uuid', '试卷知识点')->select(Tag::getList());
            });
            $filter->column(1 / 2, function ($filter) {
                $filter->equal('is_recommend', '推荐状态')->select($this->status);
            });
        });

        $grid->actions(function ($actions) {
            $actions->add(new CollectionExam());
            $actions->disableView();
        });

        return $grid;
    }

    public function form()
    {
        $form = new Form($this->model);

        $form->hidden('uuid', 'uuid')->default(UUID::getUUID())->readonly();
        $form->select('exam_category_uuid', '试卷分类')->options(Category::getList())->required();
        $form->select('exam_tag_uuid', '试卷知识点')->options(Tag::getList())->required();
        $form->text('title', '试卷标题')->required()->autofocus()->help('长度控制在32位以内');
        $form->image('cover', '试卷封面')->uniqueName()->required()->help('小程序内展示的图片');
        $form->time('exam_time', '答题时间')->required();
        $form->number('submit_number', '答题人数')->readonly()->default(0)->required();
        $form->switch('is_recommend', '是否推荐')->help('推荐的试题将会在小程序首页进行展示');
        $form->starRating('level', '难易等级');
        $form->switch('is_show', '显示状态')->states($this->switchStatus)->placeholder('是否显示');
        $form->UEditor('content', '试卷介绍')->required();

        return $form;
    }

    public function detail($id)
    {
        return new Show($this->model::query()->findOrFail($id));
    }
}
