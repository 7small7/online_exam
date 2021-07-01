<?php
declare(strict_types = 1);

namespace App\Admin\Controllers\Article;


use App\Admin\Controllers\BaseController;
use App\Libs\UUID;
use App\Models\Admin\Article\Article;
use App\Models\Admin\Article\Category;
use Encore\Admin\Form;
use Encore\Admin\Grid;

/**
 * 文章
 *
 * Class ArticleController
 * @package App\Admin\Controllers\Article
 */
class ArticleController extends BaseController
{
    protected $title = '文章';

    public function __construct(Article $article)
    {
        $this->model = $article;
    }

    public function grid()
    {
        $grid = new Grid($this->model);
        $status = $this->status;

        $grid->column('id', '数据编号')->sortable();
        $grid->column('uuid', '文章编号')->copyable();
        $grid->column('category.title', '文章分类');
        $grid->column('title', '文章名称');
        $grid->column('cover', '文章封面')->lightbox($this->imageStyle);
        $grid->column('orders', '显示顺序')->sortable();
        $grid->column('publish_date', '发布日期');
        $grid->column('author', '发布人');
        $grid->column('source', '文章来源');
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
                $filter->equal('article_category_uuid', '文章分类')->select((new Category())::getCategoryList());
                $filter->like('title', '文章标题');
            });
            $filter->column(1 / 2, function ($filter) {
                $filter->equal('is_show', '显示状态')->select($this->status);
                $filter->between('publish_date', '发布日期')->date();
            });
        });

        return $grid;
    }

    public function form()
    {
        $form = new Form($this->model);
        $form->hidden('uuid')->default(UUID::getUUID());
        $form->hidden('store_uuid')->default($this->storeUUID);
        $form->select('article_category_uuid', '所属类型')->options((new Category())::getCategoryList());
        $form->text('title', '文章标题')->required();
        $form->image('cover', '文章封面')->uniqueName()->required();
        $form->UEditor('content', '文章内容')->required();
        $form->date('publish_date', '发布日期')->default(date('Y-m-d'))->required();
        $form->text('author', '发布人')->required()->required();
        $form->text('source', '文章来源');
        $form->number('read_number', '阅读数量')->default(0);
        $form->switch('is_show', '显示状态')->options($this->switchStatus);

        return $form;
    }
}
