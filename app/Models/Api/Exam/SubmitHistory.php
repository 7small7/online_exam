<?php


namespace App\Models\Api\Exam;


use App\Models\Common\ExamSubmitHistory;

/**
 * 用户答题记录
 *
 * Class ExamSubmitHistory
 * @package App\Models\Api\Exam
 */
class SubmitHistory extends ExamSubmitHistory
{
    public function collection()
    {
        return $this->belongsTo(Collection::class, 'exam_collection_uuid', 'uuid');
    }

    public function exam()
    {
        return $this->belongsTo(Exam::class, 'exam_item_uuid', 'uuid');
    }
}
