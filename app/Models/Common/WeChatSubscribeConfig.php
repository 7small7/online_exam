<?php


namespace App\Models\Common;

/**
 * 微信订阅消息配置
 *
 * Class WeChatSubscribeConfig
 * @package App\Models\Common
 */
class WeChatSubscribeConfig extends BaseModel
{
    protected $table = 'wechat_subscribe_config';

    public function getDataAttribute($key)
    {
        return json_decode($key, true);
    }
}
