<?php
declare(strict_types=1);

namespace App\Models\Api\Platform;


use App\Mapping\Cache\UserInfo;
use App\Models\Common\PlatformMessageContent;

/**
 * 消息内容
 *
 * Class Message
 * @package App\Models\Api\Platform
 */
class MessageContent extends PlatformMessageContent
{

    protected $appends = [
        'is_read',// 是否阅读
    ];

    public function getIsReadAttribute($key)
    {
        if (MessageHistory::query()->where([
            ['platform_message_content_uuid', '=', $this->attributes['uuid']],
            ['wechat_user_uuid', '=', UserInfo::getUserId()]
        ])->first(['id'])) {
            return 1;
        }

        return 0;
    }

    public function getCreatedAtAttribute($key)
    {
        return date('Y-m-d', strtotime($key));
    }
}
