<?php


namespace App\Admin\Controllers\User;


use App\Admin\Actions\Common\ShowStatus;
use App\Admin\Controllers\BaseController;
use App\Models\Admin\User\WeChat;
use Encore\Admin\Grid;

/**
 * 微信用户
 *
 * Class WeChatController
 * @package App\Admin\Controllers\User
 */
class WeChatController extends BaseController
{
    protected $title = '微信用户';

    public function __construct(WeChat $chat)
    {
        $this->model = $chat;
    }

    public function grid()
    {
        $grid   = new Grid($this->model);
        $status = $this->status;

        $grid->column('id', '数据编号')->sortable();
        $grid->column('uuid', '用户编号')->copyable();
        $grid->column('openid', 'openid')->copyable();
        $grid->column('nickname', '昵称');
        $grid->column('real_name', '真实名称');
        $grid->column('mobile', '手机');
        $grid->column('avatar_url', '头像')->lightbox($this->imageStyle);
        $grid->column('gender', '性别')->using([1 => '男', 2 => '女', 0 => '未知']);
        $grid->column('country', '国家');
        $grid->column('province', '省');
        $grid->column('city', '市');
        $grid->column('district', '区');
        $grid->column('address', '地址');
        $grid->column('is_show', '状态')->display(function ($isShow) use ($status) {
            $text = $status[$isShow];
            if ($isShow == 0) {
                return "<span class='label bg-red'>{$text}</span>";
            } elseif ($isShow == 1) {
                return "<span class='label bg-green'>{$text}</span>";
            } else {
                return '异常';
            }
        });
        $grid->column('created_at', '注册时间');
        $grid->column('updated_at', '最近登录');
        $grid->column('birthday', '出生日期');
        $grid->model()->orderByDesc('id');

        $grid->filter(function ($filter) {
            $filter->disableIdFilter();
            $filter->column(1 / 2, function ($filter) {
                $filter->like('nickname', '用户昵称');
            });
            $filter->column(1 / 2, function ($filter) {
                $filter->equal('is_show', '禁用状态')->select($this->status);
            });
        });

        $grid->disableCreateButton();
        $grid->actions(function ($actions) {
            $actions->disableDelete();
            $actions->disableView();
            $actions->disableEdit();
            $actions->add(new ShowStatus());
        });

        return $grid;
    }
}
