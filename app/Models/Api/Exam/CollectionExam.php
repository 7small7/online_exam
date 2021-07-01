<?php

namespace App\Models\Api\Exam;

use App\Models\Common\CollectionExam as CollectionExamModel;

/**
 * 试卷选择题关联
 *
 * Class CollectionExam
 * @package App\Models\Api\Exam
 */
class CollectionExam extends CollectionExamModel
{
    public function collection()
    {
        return $this->belongsTo(Collection::class, 'exam_collection_uuid', 'uuid');
    }

    public function exam()
    {
        return $this->hasMany(Exam::class, 'exam_item_uuid', 'uuid');
    }
}
