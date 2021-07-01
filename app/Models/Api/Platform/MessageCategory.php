<?php
declare(strict_types=1);

namespace App\Models\Api\Platform;


use App\Mapping\Cache\UserInfo;
use App\Models\Common\PlatformMessageCategory;

/**
 * 消息类型
 *
 * Class MessageCategory
 * @package App\Models\Api\Platform
 */
class MessageCategory extends PlatformMessageCategory
{
    protected $appends = [
        'message_number',// 分类下的消息未阅读数量
    ];


    // 消息未阅读数量
    public function getMessageNumberAttribute($key)
    {
        $contentCount = MessageContent::query()
            ->where([['platform_message_category_uuid', '=', $this->attributes['uuid']]])
            ->count('id');

        $historyCount = MessageHistory::query()
            ->where([
                ['platform_message_category_uuid', '=', $this->attributes['uuid']],
                ['wechat_user_uuid', '=', UserInfo::getUserId()]
            ])
            ->count(['id']);

        return $contentCount - $historyCount;
    }
}
