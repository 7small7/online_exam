<?php

namespace App\Exceptions;

use Exception;

/**
 * 数据库异常处理机制
 *
 * Class DBException
 * @package App\Exceptions
 */
class DBException extends Exception
{
    /**
     * 数据库异常处理记录
     *
     * @author kert
     */
    public function report()
    {
        // 用于记录异常
    }
}
