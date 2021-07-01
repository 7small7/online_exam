<?php
declare(strict_types=1);

namespace App\Http\Middleware;


use Closure;

/**
 * 跨域中间件
 * Class EnableCrossRequestMiddleware
 * @package App\Http\Middleware
 */
class EnableCrossRequestMiddleware
{
    public function handle($request, Closure $next)
    {
        $response = $next($request);
        $response->header('Access-Control-Allow-Origin', "*");
        $response->header('Access-Control-Allow-Headers', '*');
        $response->header('Access-Control-Allow-Methods', 'GET,HEAD,PUT,PATCH,POST,DELETE,OPTIONS');
        $response->header('Access-Control-Allow-Credentials', 'TRUE');

        return $response;
    }
}
