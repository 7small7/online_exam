<?php
declare(strict_types=1);

namespace App\Mapping\Response;

/**
 * http code
 *
 * Class ApiHttpCode
 * @package App\Mapping\Response
 */
class ApiHttpCode
{
    CONST SUCCESS = 200;

    CONST SERVER_ERROR = 500;

    CONST NO_AUTH = 401;

    CONST URL_NOT_FUND = 404;

    CONST FORBIDDEN = 403;

    CONST HTTP_MESSAGE = [
        self::SUCCESS      => '请求成功',
        self::SERVER_ERROR => '服务异常',
        self::NO_AUTH      => '暂无权限',
        self::URL_NOT_FUND => '资源未找到',
        self::FORBIDDEN    => '请求不允许被处理',

    ];

    /**
     * 根据code获取对应的message
     *
     * @param int $httpCode
     * @return string
     * @author kert
     */
    public static function getMessage(int $httpCode): string
    {
        return self::HTTP_MESSAGE[$httpCode];
    }
}
