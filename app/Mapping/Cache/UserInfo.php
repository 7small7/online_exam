<?php
declare(strict_types=1);

namespace App\Mapping\Cache;

use App\Libs\Cache\Redis\RedisConnection;
use Illuminate\Support\Facades\Request;

/**
 * 用户信息相关
 *
 * Class UserInfo
 * @package App\Mapping\Cache
 */
class UserInfo
{
    /**
     * 获取用户信息
     *
     * @return array
     * @author kert
     */
    public static function getUserInfo(): array
    {
        $loginToken = Request::header('Authentication', '');
        $userInfo   = RedisConnection::getInstance()->get(RedisCacheKey::USER_LOGIN_TOKEN . $loginToken);

        // TODO 用户登录token过期时会发生错误
        if (!empty($userInfo)) {
            return json_decode($userInfo, true);
        }

        return [];
    }

    /**
     * 获取用户id
     *
     * @return string
     * @author kert
     */
    public static function getUserId(): string
    {
        return !empty(self::getUserInfo()) ? self::getUserInfo()['uuid'] : '';
    }
}
