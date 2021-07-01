<?php
declare(strict_types = 1);

namespace App\Models\Api\User;

use App\Models\Common\WeChatUserSubscribe as WeChatUserSubscribeModel;

/**
 * 微信用户订阅消息
 *
 * Class WeChatUserSubscribe
 * @package App\Models\Api\User
 */
class WeChatUserSubscribe extends WeChatUserSubscribeModel
{
    public function user()
    {
        return $this->hasOne(WeChatUser::class, 'uuid', 'wechat_user_uuid');
    }
}
