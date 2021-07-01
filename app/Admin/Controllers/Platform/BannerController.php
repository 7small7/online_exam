<?php


namespace App\Admin\Controllers\Platform;


use App\Admin\Controllers\BaseController;
use App\Libs\UUID;
use App\Models\Admin\Platform\Banner;
use App\Models\Admin\Platform\ConstConfig;
use Encore\Admin\Form;
use Encore\Admin\Grid;

/**
 * 轮播图
 *
 * Class BannerController
 * @package App\Admin\Controllers\Platform
 */
class BannerController extends BaseController
{
    protected $title = '轮播图管理';

    private $key = 'banner';

    private $redirectKey = 'wechat_mini_navi';

    public function __construct(Banner $banner)
    {
        $this->model = $banner;
    }

    public function grid()
    {
        $grid   = new Grid($this->model);
        $status = $this->status;

        $grid->column('id', '数据编号')->sortable();
        $grid->column('uuid', '轮播图编号')->copyable();
        $grid->column('type', '跳转类型')->using(ConstConfig::list((string)$this->redirectKey));
        $grid->column('position', '显示位置')->using(ConstConfig::list((string)$this->key));
        $grid->column('title', '封面标题');
        $grid->column('cover', '封面图片')->lightbox($this->imageStyle);
        $grid->column('url', '跳转地址');
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
                $filter->like('title', '相关标题');
                $filter->equal('position', '显示位置')->select(ConstConfig::list((string)$this->key));
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
        $form->select('type', '跳转类型')->options(ConstConfig::list((string)$this->redirectKey))->required();
        $form->select('position', '显示位置')->options(ConstConfig::list((string)$this->key))->required();
        $form->text('title', '封面标题')->required()->autofocus()->help('长度控制在32位以内');
        $form->image('cover', '图片地址')->uniqueName()->required()->help('小程序内展示的图片');
        $form->text('url', '跳转地址')->help('填写有效的小程序路径,如/pages/index/index?key1=value1&key2=value2');
        $form->switch('is_show', '显示状态')->states($this->switchStatus)->placeholder('是否显示');
        $form->number('orders', '显示顺序')->help('值越大越显示在前')->required()->default(0);

        return $form;
    }

}
