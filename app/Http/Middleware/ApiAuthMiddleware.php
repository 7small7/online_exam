<?php
declare(strict_types=1);

namespace App\Http\Middleware;

use App\Libs\Cache\Redis\RedisConnection;
use App\Mapping\Cache\RedisCacheKey;
use App\Mapping\Response\ApiCode;
use App\Mapping\Response\ApiHttpCode;
use App\Mapping\Response\ApiResponse;
use Closure;
use Illuminate\Http\Request;

/**
 * Api模块鉴权中间件
 *
 * Class ApiAuthMiddleware
 * @package App\Http\Middleware
 */
class ApiAuthMiddleware
{
    /**
     * 鉴权处理
     *
     * @param Request $request
     * @param \Closure $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $userLoginToken = $request->header('Authentication', '');
        $fullTokenName  = RedisCacheKey::USER_LOGIN_TOKEN . $userLoginToken;

//        $returnStatus = 2;
//        if (empty($userLoginToken)) {// token不存在
//            $returnStatus = 1;
//        }

        $userInfo = RedisConnection::getInstance()->get($fullTokenName);
        if (empty($userInfo)) {// token信息不存在
            return ApiResponse::defineResponse(
                (int)ApiCode::ERROR,
                (string)ApiCode::getMessage(ApiCode::ERROR),
                (array)[],
                (int)ApiHttpCode::NO_AUTH
            );
        }

//        if ($userInfo['user_agent'] != $request->header('user-agent')) {// 客户端agent不正确
//            $returnStatus = 1;
//        }

//        if ($returnStatus == 1) {
//            return ApiResponse::defineResponse(
//                (int)ApiCode::ERROR,
//                (string)ApiCode::getMessage(ApiCode::ERROR),
//                (array)[],
//                (int)ApiHttpCode::NO_AUTH
//            );
//        } else {
//
//        }

        return $next($request);


    }
}
