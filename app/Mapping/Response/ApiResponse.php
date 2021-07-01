<?php
declare(strict_types=1);

namespace App\Mapping\Response;

use Illuminate\Http\JsonResponse;

/**
 * 接口返回参数
 *
 * Class ApiResponse
 * @package App\Mapping\Response
 */
class ApiResponse
{
    /**
     * 成功接口参数
     *
     * @param array $responseInfo 返回参数
     * @return JsonResponse
     * @author kert
     */
    public static function success(array $responseInfo = [])
    {
        return response()->json([
            'code' => ApiCode::SUCCESS,
            'msg'  => ApiCode::getMessage(ApiCode::SUCCESS),
            'data' => $responseInfo
        ]);
    }

    /**
     * 失败接口参数
     *
     * @param array $responseInfo 返回参数
     * @return JsonResponse
     * @author kert
     */
    public static function error(array $responseInfo = [])
    {
        return response()->json([
            'code' => ApiCode::ERROR,
            'msg'  => ApiCode::getMessage(ApiCode::ERROR),
            'data' => $responseInfo
        ]);
    }

    /**
     * 自定义返回信息内容
     *
     * @param int $code 业务code
     * @param string $message 返回信息
     * @param array $responseInfo 返回数据
     * @param int $httpCode 返回http状态码
     * @return JsonResponse
     * @author kert
     */
    public static function defineResponse(int $code = 0, string $message = '', array $responseInfo = [], int $httpCode = 0)
    {
        return response()->json([
            'code' => empty($code) ? ApiCode::ERROR : $code,
            'msg'  => empty($message) ? ApiCode::getMessage(ApiCode::ERROR) : $message,
            'data' => empty($responseInfo) ? [] : $responseInfo,
        ], empty($httpCode) ? ApiHttpCode::SERVER_ERROR : $httpCode);
    }
}
