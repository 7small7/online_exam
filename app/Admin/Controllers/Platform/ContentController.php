<?php


namespace App\Admin\Controllers\Platform;


use App\Admin\Controllers\BaseController;
use App\Libs\UUID;
use App\Models\Admin\Platform\ConstConfig;
use App\Models\Admin\Platform\Content;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

/**
 * 平台文章
 *
 * Class ContentController
 * @package App\Admin\Controllers\Platform
 */
class ContentController extends BaseController
{
    protected $title = '消息内容';

    private $key = 'document';

    public function __construct(Content $category)
    {
        $this->model = $category;
    }

    public function grid()
    {
        $grid   = new Grid($this->model);
        $status = $this->status;

        $grid->column('id', '数据编号')->sortable();
        $grid->column('uuid', '内容编号')->copyable();
        $grid->column('position', '显示位置')->using(ConstConfig::list((string)$this->key));
        $grid->column('title', '文章标题');
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
        $form->select('position', '文章位置')->options(ConstConfig::list((string)$this->key))->required();
        $form->text('title', '文章标题')->required();
        $form->UEditor('content', '文章内容')->required();
        $form->hidden('store_uuid')->default($this->storeUUID);
        $form->switch('is_show', '显示状态')->states($this->switchStatus)->placeholder('是否显示');

        return $form;
    }

    public function detail($id)
    {
        return new Show($this->model::query()->findOrFail($id));
    }
}
