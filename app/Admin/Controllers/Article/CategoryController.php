<?php
declare(strict_types=1);

namespace App\Admin\Controllers\Article;


use App\Admin\Controllers\BaseController;
use App\Libs\UUID;
use App\Models\Admin\Article\Category;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

/**
 * 文章分类
 *
 * Class CategoryController
 * @package App\Admin\Controllers\Article
 */
class CategoryController extends BaseController
{
    protected $title = '分类';

    public function __construct(Category $category)
    {
        $this->model = $category;
    }

    public function grid()
    {
        $grid   = new Grid($this->model);
        $status = $this->status;

        $grid->column('id', '数据编号')->sortable();
        $grid->column('uuid', '分类编号')->copyable();
        $grid->column('parent.title', '上级分类');
        $grid->column('title', '分类名称');
        $grid->column('cover', '封面图片')->lightbox($this->imageStyle);
        $grid->column('orders', '显示顺序')->sortable();
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
                $filter->equal('is_show', '显示状态')->select($this->status);
            });
        });

        return $grid;
    }

    public function form()
    {
        $form = new Form($this->model);
        $form->hidden('uuid')->default(UUID::getUUID());
        $form->hidden('store_uuid')->default($this->storeUUID);
        $form->select('parent_uuid', '上级分类')->options($this->model::getParentList())
            ->help('不选择任何类型，则该数据默认设置为顶级分类');
        $form->text('title', '分类名称')->required();
        $form->image('cover', '分类封面')->uniqueName();
        $form->number('orders', '显示顺序')->help('值越大越显示在前')->required()->default(0);
        $form->switch('is_show', '显示状态')->options($this->switchStatus);

        return $form;
    }

    public function detail($id)
    {
        return new Show($this->model::query()->findOrFail($id));
    }
}
