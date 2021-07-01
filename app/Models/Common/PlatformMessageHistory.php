<?php
declare(strict_types=1);

namespace App\Models\Common;

/**
 * 平台消息历史
 *
 * Class PlatformMessageHistory
 * @package App\Models\Common
 */
class PlatformMessageHistory extends BaseModel
{
    protected $table = 'platform_message_history';

    protected $fillable = [
        'uuid',
        'platform_message_category_uuid',
        'platform_message_content_uuid',
        'wechat_user_uuid',
        'is_show',
        'store_uuid'
    ];
}
