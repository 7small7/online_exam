<?php


namespace App\Mapping\Config;

/**
 * 积分配置
 *
 * Class ScoreKey
 * @package App\Mapping\Cache
 */
class ScoreKey
{
    /**
     * 用户注册
     */
    CONST LOGIN_SCORE = 'register';

    /**
     * 登录积分
     */
    CONST SIGN = 'sign';

    /**
     * 用户分享
     */
    CONST SHARE = 'share';


    public static $score = [
        self::LOGIN_SCORE => '用户注册',
        self::SIGN => '每日签到',
        self::SHARE => '用户分享',
    ];
}
