<?php

namespace App\Http\Middleware;

use App\Libs\Cache\Redis\RedisConnection;
use App\Mapping\Cache\RedisCacheKey;
use App\Mapping\Response\ApiCode;
use App\Mapping\Response\ApiHttpCode;
use App\Mapping\Response\ApiResponse;
use Closure;
use Illuminate\Http\Request;

/**
 * 商户鉴权中间件
 *
 * Class StoreAuthMiddleware
 * @package App\Http\Middleware
 */
class StoreAuthMiddleware
{
    /**
     * 验证商户端的登录信息是否合法.
     *
     * @param Request $request
     * @param \Closure $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $userLoginToken = $request->header('Authentication');

        if (empty(RedisConnection::getInstance()->get(RedisCacheKey::STORE_LOGIN_TOKEN . $userLoginToken))) {
            return ApiResponse::defineResponse(
                (int)ApiCode::LOGIN_NOT_FUND,
                (string)ApiCode::getMessage(ApiCode::LOGIN_NOT_FUND),
                (array)[],
                (int)ApiHttpCode::NO_AUTH
            );
        }
        return $next($request);
    }
}
