<?php
declare(strict_types=1);

namespace App\Models\Admin\Platform;


use App\Models\Common\AdminBaseModel;

/**
 * 微信订阅消息发送历史
 *
 * Class WeChatSubscribeHistory
 * @package App\Models\Admin\Platform
 */
class WeChatSubscribeHistory extends AdminBaseModel
{
    protected $table = 'wechat_subscribe_history';
}
