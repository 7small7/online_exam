<?php


namespace App\Admin\Controllers\Exam;


use App\Admin\Controllers\BaseController;
use App\Libs\UUID;
use App\Models\Admin\Exam\Tag;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

/**
 * 试卷知识点
 *
 * Class TagController
 * @package App\Admin\Controllers\Exam
 */
class TagController extends BaseController
{
    protected $title = '知识点';

    public function __construct(Tag $tag)
    {
        $this->model = $tag;
    }

    public function grid()
    {
        $grid   = new Grid($this->model);
        $status = $this->status;

        $grid->column('id', '数据编号')->sortable();
        $grid->column('uuid', '知识点编号')->copyable();
        $grid->column('title', '知识点名称');
        $grid->column('remark', '知识点描述');
        $grid->column('is_show', '是否显示')->display(function ($isShow) use ($status) {
            $text = $status[$isShow];
            if ($isShow == 0) {
                return "<span class='label bg-red'>{$text}</span>";
            } elseif ($isShow == 1) {
                return "<span class='label bg-green'>{$text}</span>";
            } else {
                return '异常';
            }
        });
        $grid->model()->orderByDesc('id');

        $grid->filter(function ($filter) {
            $filter->disableIdFilter();
            $filter->column(1 / 2, function ($filter) {
                $filter->like('title', '知识点名称');
            });
            $filter->column(1 / 2, function ($filter) {
                $filter->equal('is_show', '启用状态')->select($this->status);
            });
        });

        $grid->actions(function ($actions) {
            $actions->disableView();
        });

        return $grid;
    }

    public function form()
    {
        $form = new Form($this->model);

        $form->hidden('uuid', 'uuid')->default(UUID::getUUID())->readonly();
        $form->hidden('store_uuid')->default($this->storeUUID);
        $form->text('title', '知识点名称')->required()->help('长度控制在10位以内');
        $form->textarea('remark', '知识点描述');
        $form->switch('is_show', '显示状态')->states($this->switchStatus);

        return $form;
    }

    public function detail($id)
    {
        return new Show($this->model::query()->findOrFail($id));
    }
}
