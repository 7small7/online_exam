<?php
declare(strict_types=1);

namespace App\Models\Common;

/**
 * 微信用户订阅消息
 *
 * Class WeChatUserSubscribe
 * @package App\Models\Common
 */
class WeChatUserSubscribe extends BaseModel
{
    protected $table = 'wechat_user_subscribe';

    protected $fillable = [
        'uuid',
        'store_uuid',
        'wechat_user_uuid',
        'template_id',
        'is_used',
        'is_show',
    ];
}
