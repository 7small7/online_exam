<?php


namespace App\Models\Admin\Exam;


use App\Models\Admin\User\WeChat;
use App\Models\Common\AdminBaseModel;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

/**
 * 搜索历史
 *
 * Class SearchHistory
 * @package App\Models\Admin\Exam
 */
class SearchHistory extends AdminBaseModel
{
    protected $table = 'exam_search_history';

    /**
     * 微信用户
     *
     * @return BelongsTo
     */
    public function WeChatUser()
    {
        return $this->belongsTo(WeChat::class, 'wechat_user_uuid', 'uuid');
    }
}
