<?php
declare(strict_types=1);

namespace App\Mapping\Cache;

/**
 * Redis缓存key和expire
 *
 * Class CacheKey
 * @package App\Mapping\Cache
 */
class RedisCacheKey
{
    /** @var string api登录token */
    CONST USER_LOGIN_TOKEN = 'login_token:';

    /** @var string store端登录token */
    CONST STORE_LOGIN_TOKEN = 'store_login_token:';

    CONST EXPIRE = [
        self::USER_LOGIN_TOKEN  => 864000,
        self::STORE_LOGIN_TOKEN => 864000,
    ];
}
