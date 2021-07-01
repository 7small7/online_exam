<?php
declare(strict_types=1);

namespace App\Models\Admin\Platform;


use App\Models\Common\AdminBaseModel;

/**
 * 微信订阅消息配置
 *
 * Class WeChatSubscribeConfig
 * @package App\Models\Admin\Platform
 */
class WeChatSubscribeConfig extends AdminBaseModel
{
    protected $table = 'wechat_subscribe_config';

    public function getDataAttribute($value)
    {
        return array_values(json_decode($value, true) ?: []);
    }

    public function setDataAttribute($value)
    {
        $this->attributes['data'] = json_encode(array_values($value));
    }
}
