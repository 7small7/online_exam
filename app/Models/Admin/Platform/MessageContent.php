<?php


namespace App\Models\Admin\Platform;


use App\Models\Common\AdminBaseModel;

/**
 * 消息内容
 *
 * Class MessageContent
 * @package App\Models\Admin\Platform
 */
class MessageContent extends AdminBaseModel
{
    protected $table = 'platform_message_content';

    public function category()
    {
        return $this->belongsTo(MessageCategory::class, 'platform_message_category_uuid', 'uuid');
    }
}
