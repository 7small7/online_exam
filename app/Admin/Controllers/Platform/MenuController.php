<?php
declare(strict_types = 1);

namespace App\Admin\Controllers\Platform;


use App\Admin\Controllers\BaseController;
use App\Libs\UUID;
use App\Models\Admin\Platform\ConstConfig;
use App\Models\Admin\Platform\Menu;
use Encore\Admin\Form;
use Encore\Admin\Grid;

/**
 * 用户端菜单
 *
 * Class MenuController
 * @package App\Admin\Controllers\Platform
 */
class MenuController extends BaseController
{
    protected $title = '用户端菜单';

    private $key = 'wechat_mini_navi';

    private $showKey = 'wechat_menu';

    public function __construct(Menu $menu)
    {
        $this->model = $menu;
    }

    public function grid()
    {
        $grid = new Grid($this->model);
        $status = $this->status;

        $grid->column('id', '数据编号')->sortable();
        $grid->column('uuid', '菜单编号')->copyable();
        $grid->column('title', '菜单名称');
        $grid->column('position', '显示位置')->using(ConstConfig::list((string)$this->showKey));
        $grid->column('type', '跳转类型')->using(ConstConfig::list((string)$this->key));
        $grid->column('url', '跳转地址')->copyable();
        $grid->column('cover', '菜单图标')->lightbox($this->imageStyle);
        $grid->column('orders', '显示顺序')->editable();
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
                $filter->like('title', '菜单名称');
            });
            $filter->column(1 / 2, function ($filter) {
                $filter->equal('position', '显示位置')->select(ConstConfig::list((string)$this->showKey));
                $filter->equal('type', '跳转类型')->select(ConstConfig::list((string)$this->key));
            });
        });

        $grid->actions(function ($action) {
            $action->disableView();
        });

        return $grid;
    }

    public function form()
    {
        $form = new Form($this->model);
        $form->hidden('uuid')->default(UUID::getUUID());
        $form->hidden('store_uuid')->default($this->storeUUID);
        $form->text('title', '菜单名称')->required();
        $form->image('cover', '菜单图标')->required()->uniqueName();
        $form->select('type', '跳转类型')->options(ConstConfig::list((string)$this->key))->required();
        $form->text('url', '跳转地址')->required()->help('小程序跳转地址，必须以"/"开头,例如/pages/index/index');
        $form->select('position', '显示位置')->options(ConstConfig::list((string)$this->showKey))->required();
        $form->number('orders', '显示顺序')->default(0)->help('值越大越在前面显示');
        $form->switch('is_show', '显示状态')->options($this->switchStatus);

        return $form;
    }
}
