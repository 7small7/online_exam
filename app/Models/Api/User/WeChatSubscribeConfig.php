<?php
declare(strict_types=1);

namespace App\Models\Api\User;

use App\Mapping\Cache\UserInfo;
use App\Models\Common\WeChatSubscribeConfig as WeChatSubscribeConfigModel;

/**
 * 微信订阅消息配置
 *
 * Class WeChatSubscribeConfig
 * @package App\Models\Api\User
 */
class WeChatSubscribeConfig extends WeChatSubscribeConfigModel
{
    protected $appends = [
        'config_number'
    ];

    protected $hidden = [
        'id',
        'created_at',
        'updated_at',
        'deleted_at',
        'description',
        'is_show',
        'data',
    ];

    public function getConfigNumberAttribute($key)
    {
        return WeChatUserSubscribe::query()
            ->where([
                ['wechat_user_uuid', '=', UserInfo::getUserId()],
                ['template_id', '=', $this->attributes['template_id']],
                ['is_used', '=', 1]
            ])
            ->count(['id']);
    }
}
