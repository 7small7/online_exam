<?php

namespace App\Http\Middleware;

use App\Mapping\Response\ApiCode;
use App\Mapping\Response\ApiResponse;
use Closure;
use Illuminate\Http\Request;

/**
 * 商户中间件
 *
 * Class StoreMiddleware
 * @package App\Http\Middleware
 */
class StoreGlobalMiddleware
{
    /**
     * 验证商户端的请求头信息是否准确
     *
     * @param Request $request
     * @param \Closure $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if (!$request->hasHeader('Client-Type') || $request->header('Client-Type') != 'web_store') {
            return ApiResponse::defineResponse(
                (int)ApiCode::REQUEST_PARAMS_LACK,
                (string)ApiCode::getMessage((int)ApiCode::REQUEST_PARAMS_LACK),
                (array)$request->header());
        }
        return $next($request);
    }
}
