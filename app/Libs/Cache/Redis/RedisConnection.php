<?php
declare(strict_types=1);

namespace App\Libs\Cache\Redis;

use Illuminate\Support\Facades\Redis;

/**
 * Redis连接器
 *
 * Class RedisConnection
 * @package App\Libs\Cache\Redis
 */
class RedisConnection
{
    private static $instance;

    public $redis;

    private function __construct()
    {
        $this->redis = Redis::connection();
    }

    private function __clone()
    {
        // TODO 方式clone自动调用
    }

    private function __wakeup()
    {
        // TODO 防止序列化对象时，自动调用
    }

    public static function getInstance()
    {
        if (!self::$instance instanceof self) self::$instance = new self();

        return self::$instance->redis;
    }
}
