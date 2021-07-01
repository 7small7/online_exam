<?php

namespace App\Http\Middleware;

use Closure;

/**
 * Api模块全局中间件
 * Class ApiGlobalMiddleware
 * @package App\Http\Middleware
 */
class ApiGlobalMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param \Illuminate\Http\Request $request
     * @param \Closure $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        return $next($request);
    }
}
