<?php
declare(strict_types = 1);

namespace App\Admin\Controllers\User;


use App\Admin\Controllers\BaseController;
use App\Models\Admin\User\UserSubscribe;
use Encore\Admin\Grid;

/**
 * 订阅消息
 *
 * Class SubscribeController
 * @package App\Admin\Controllers\User
 */
class SubscribeController extends BaseController
{
    protected $title = '消息订阅';

    public function __construct(UserSubscribe $subscribe)
    {
        $this->model = $subscribe;
    }

    public function grid()
    {
        $grid = new Grid($this->model);
        $grid->column('id', '数据id')->sortable();
        $grid->column('uuid', '数据编号')->copyable();
        $grid->column('user.nickname', '用户昵称')->copyable();
        $grid->column('user.openid', '用户OPENID')->copyable();
        $grid->column('config.title', '配置名称');
        $grid->column('template_id', '微信模板ID')->copyable();
        $grid->column('is_used', '显示状态')->display(function ($isUsed) {
            if ($isUsed == 0) {
                return "<span class='label bg-red'>不可用</span>";
            } elseif ($isUsed == 1) {
                return "<span class='label bg-green'>可用</span>";
            } else {
                return '异常';
            }
        });
        $grid->column('created_at', '订阅时间');
        $grid->model()->orderByDesc('id');

        $grid->filter(function ($filter) {
            $filter->disableIdFilter();
            $filter->column(1 / 2, function ($filter) {
                $filter->like('config.title', '配置名称');
                $filter->like('user.nickname', '用户昵称');
            });
            $filter->column(1 / 2, function ($filter) {
                $filter->equal('is_used', '使用状态')->select([
                    '不可用',
                    '可用'
                ]);
            });
        });
        $grid->disableBatchActions();
        $grid->disableCreateButton();
        $grid->disableActions();

        return $grid;
    }
}
