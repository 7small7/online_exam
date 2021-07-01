<?php
declare(strict_types = 1);

namespace App\Models\Common;

/**
 * 试卷提交记录
 *
 * Class ExamSubmitHistory
 * @package App\Models\Common
 */
class ExamSubmitHistory extends BaseModel
{
    protected $table = 'exam_submit_history';

    protected $fillable = [
        'uuid',
        'wechat_user_uuid',
        'exam_collection_uuid',
        'exam_item_uuid',
        'success_number',
        'error_number',
        'score',
        'submit_time',
        'answer',
        'select_answer',
        'store_uuid',
    ];

    protected $appends = [
        'success_total_score' // 答题总分
    ];

    public function getSuccessTotalScoreAttribute($key)
    {
        return self::query()->where('exam_collection_uuid', '=', $this->attributes['exam_collection_uuid'])
            ->sum('score');
    }
}
