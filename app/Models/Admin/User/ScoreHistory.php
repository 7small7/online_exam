<?php


namespace App\Models\Admin\User;


use App\Models\Common\AdminBaseModel;

/**
 * 用户积分历史
 *
 * Class ScoreHistory
 * @package App\Models\Admin\User
 */
class ScoreHistory extends AdminBaseModel
{
    protected $table = 'user_score_history';

    public function user()
    {
        return $this->belongsTo(WeChat::class, 'wechat_user_uuid', 'uuid');
    }
}
