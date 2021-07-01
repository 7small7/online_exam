<?php


namespace App\Admin\Controllers\Platform;


use App\Admin\Controllers\BaseController;
use App\Libs\UUID;
use App\Models\Admin\Platform\MessageCategory;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

/**
 * 消息分类
 *
 * Class MessageCategoryController
 * @package App\Admin\Controllers\Platform
 */
class MessageCategoryController extends BaseController
{
    protected $title = '消息类型';

    public function __construct(MessageCategory $category)
    {
        $this->model = $category;
    }

    public function grid()
    {
        $grid   = new Grid($this->model);
        $status = $this->status;

        $grid->column('id', '数据编号')->sortable();
        $grid->column('uuid', '分类编号')->copyable();
        $grid->column('title', '分类名称');
        $grid->column('cover', '分类图标')->lightbox($this->imageStyle);
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
        $grid->model()->orderByDesc('id');

        $grid->filter(function ($filter) {
            $filter->disableIdFilter();
            $filter->column(1 / 2, function ($filter) {
                $filter->like('title', '分类名称');
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
        $form->text('title', '分类名称')->required()->autofocus()->help('长度控制在32位以内');
        $form->image('cover', '分类图标')->uniqueName()->required()->help('在小程序内展示的图标');
        $form->switch('is_show', '显示状态')->states($this->switchStatus)->placeholder('是否显示');

        return $form;
    }

    public function detail($id)
    {
        return new Show($this->model::query()->findOrFail($id));
    }
}
