<?php
declare(strict_types=1);

namespace App\Admin\Controllers\Platform;


use App\Admin\Controllers\BaseController;
use App\Libs\UUID;
use App\Models\Admin\Platform\WeChatSubscribeConfig;
use Encore\Admin\Form;
use Encore\Admin\Grid;

/**
 * 微信订阅消息配置
 *
 * Class WeChatSubscribeConfigController
 * @package App\Admin\Controllers\Platform
 */
class WeChatSubscribeConfigController extends BaseController
{
    protected $title = '订阅消息配置';

    private $state = [
        'developer' => '开发版',
        'trial'     => '体验版',
        'formal'    => '正式版',
    ];

    private $lang = [
        'zh_CN' => '简体中文',
        'en_US' => '英文',
        'zh_HK' => '繁体中文'
    ];

    public function __construct(WeChatSubscribeConfig $config)
    {
        $this->model = $config;
    }


    public function grid()
    {
        $grid   = new Grid($this->model);
        $status = $this->status;

        $grid->column('id', '数据编号')->sortable();
        $grid->column('uuid', '配置编号')->copyable();
        $grid->column('cover', '配置图标')->lightbox($this->imageStyle);
        $grid->column('title', '配置名称');
        $grid->column('template_id', '订阅消息template_id')->copyable();
        $grid->column('page', '跳转页面');
        $grid->column('miniprogram_state', '跳转小程序类型')->using($this->state);
        $grid->column('lang', '语言类型')->using($this->lang);
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
        $grid->column('orders', '显示顺序')->sortable();
        $grid->model()->orderByDesc('id');

        $grid->filter(function ($filter) {
            $filter->disableIdFilter();
            $filter->column(1 / 2, function ($filter) {
                $filter->like('title', '配置名称');
                $filter->equal('template_id', 'template_id');
                $filter->equal('uuid', '配置编号');
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

        $form->hidden('store_uuid', '商户uuid')->default($this->storeUUID)->readonly();
        $form->hidden('uuid', '配置uuid')->default(UUID::getUUID())->readonly();
        $form->image('cover', '配置图标')->required()->uniqueName();
        $form->text('title', '配置名称')->required()->help('推荐4个字，用于客户端展示。');
        $form->text('description', '配置说明')->help('配置描述');
        $form->text('template_id', '模板id')->required()->help('填写微信订阅消息模板id');
        $form->table('data', '发送数据', function ($table) {
            $table->text('key', '消息key名称')->required();
            $table->text('value', '消息value名称')->default('value')->required();
            $table->text('desc', '消息key描述');
        });
        $form->text('page', '跳转页面')
            ->help('填写微信小程序内有效的page页面地址，例如/pages/index/index?query_id=xxxx&title=xxx');
        $form->select('miniprogram_state', '小程序类型')->options($this->state)->default('formal')->required();
        $form->select('lang', '语言类型')->options($this->lang)->default('zh_CN')->required();
        $form->switch('is_show', '显示状态')->states($this->switchStatus)->default(1);
        $form->number('orders', '显示顺序')->help('值越大，显示的权重越高')->default(0);

        return $form;
    }
}
