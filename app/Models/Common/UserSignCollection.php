<?php
declare(strict_types=1);

namespace App\Models\Common;

/**
 * 微信用户签到汇总
 *
 * Class UserSignCollection
 * @package App\Models\Common
 */
class UserSignCollection extends BaseModel
{
    protected $table = 'user_sign_collection';

    protected $fillable = [
        'uuid',
        'wechat_user_uuid',
        'sign_number',
        'is_show',
        'store_uuid',
    ];
}
