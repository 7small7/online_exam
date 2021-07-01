<?php


namespace App\Admin\Controllers\Exam;


use App\Admin\Controllers\BaseController;
use App\Libs\UUID;
use App\Models\Admin\Exam\Category;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\MessageBag;

/**
 * 试题分类
 *
 * Class CategoryController
 * @package App\Admin\Controllers\Exam
 */
class CategoryController extends BaseController
{
    protected $title = '试题分类';

    public function __construct(Category $category)
    {
        $this->model = $category;
    }

    public function grid()
    {
        $grid   = new Grid($this->model);
        $status = $this->status;

        $grid->column('id', '编号')->sortable();
        $grid->column('uuid', '分类编号')->copyable();
        $grid->column('parent.title', '分类等级');
        $grid->column('title', '标签名称');
        $grid->column('remark', '标签描述');
        $grid->column('cover', '分类图标')->lightbox($this->imageStyle);
        $grid->column('big_cover', '分类大图标')->lightbox($this->imageStyle);
        $grid->column('orders', '显示熟顺序')->editable();
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
        $grid->column('is_home', '是否首页')->display(function ($isHome) use ($status) {
            $text = $status[$isHome];
            if ($isHome == 0) {
                return "<span class='label bg-red'>{$text}</span>";
            } elseif ($isHome == 1) {
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
        $form      = new Form($this->model);
        $items     = $this->model::query()->where('parent_uuid', '=', null)->get(['uuid', 'title', 'parent_uuid']);
        $cateArray = [];
        foreach ($items as $value) {
            $cateArray[$value->uuid] = $value->title;
        }
        $form->hidden('uuid', 'uuid')->default(UUID::getUUID())->readonly();
        $form->hidden('store_uuid')->default($this->storeUUID);
        $form->select('parent_uuid', '上级类型')->options($cateArray)->placeholder('收支分类最多支持两级');
        $form->text('title', '分类名称')->required()->help('长度控制在10位以内');
        $form->image('cover', '分类小图标')->uniqueName()->downloadable()->required()->help('用于首页小图展示');
        $form->image('big_cover', '分类大图标')->uniqueName()->downloadable()->required()->help('用于分类列表大图展示');
        $form->number('orders', '显示顺序')->help('值越大显示位置越靠前')->default(0);
        $form->textarea('remark', '分类描述');
        $form->switch('is_show', '显示状态')->states($this->switchStatus);
        $form->switch('is_home', '首页推荐')->options($this->switchStatus);
        $form->saving(function (Form $form) {
            if ($form->parent_id == null && strtolower($form->is_home) == 'on') {
                $error = new MessageBag([
                    'title'   => '操作提示',
                    'message' => '一级分类不能被添加到首页推荐位置'
                ]);
                return back()->with(compact('error'));
            }
        });

        return $form;
    }

    public function detail($id)
    {
        return new Show($this->model::query()->findOrFail($id));
    }
}
