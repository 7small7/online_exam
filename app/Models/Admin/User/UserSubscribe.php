<?php
declare(strict_types=1);

namespace App\Models\Admin\User;


use App\Models\Admin\Platform\WeChatSubscribeConfig;
use App\Models\Common\AdminBaseModel;

/**
 * 微信订阅记录
 *
 * Class UserSubscribe
 * @package App\Models\Admin\User
 */
class UserSubscribe extends AdminBaseModel
{
    protected $table = 'wechat_user_subscribe';

    public function user()
    {
        return $this->belongsTo(WeChat::class, 'wechat_user_uuid', 'uuid');
    }

    public function config()
    {
        return $this->belongsTo(WeChatSubscribeConfig::class, 'template_id', 'template_id');
    }
}
