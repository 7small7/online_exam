<?php
declare(strict_types = 1);

namespace App\Models\Common;

use App\Mapping\Config\ScoreKey;

/**
 * 微信用户积分历史记录
 *
 * Class UserScoreHistory
 * @package App\Models\Common
 */
class UserScoreHistory extends BaseModel
{
    protected $table = 'user_score_history';

    protected $fillable = [
        'uuid',
        'type',
        'key',
        'score',
        'wechat_user_uuid',
        'is_show',
        'store_uuid',
    ];

    public function getKeyAttribute($key)
    {
        return ScoreKey::$score[$key];
    }

    public function getCreatedAtAttribute($key)
    {
        return date('Y-m-d', (int)strtotime($key));
    }
}
