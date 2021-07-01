<?php
declare(strict_types=1);

namespace App\Models\Api\User;


use App\Models\Common\WeChatUser as WeChatUserModel;

/**
 * 微信用户
 *
 * Class WeChatUser
 * @package App\Models\Api\User
 */
class WeChatUser extends WeChatUserModel
{
    protected $hidden = [
        'is_show',
        'deleted_at',
        'updated_at',
    ];

}
