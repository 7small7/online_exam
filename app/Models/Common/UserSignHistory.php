<?php
declare(strict_types=1);

namespace App\Models\Common;

/**
 * 用户签到历史记录
 *
 * Class UserSignHistory
 * @package App\Models\Common
 */
class UserSignHistory extends BaseModel
{
    protected $table = 'user_sign_history';

    protected $fillable = [
        'uuid',
        'sign_date',
        'wechat_user_uuid',
        'is_show',
        'store_uuid',
    ];
}
