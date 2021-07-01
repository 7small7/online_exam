<?php


namespace App\Models\Api\Exam;

use App\Models\Common\ExamCategory;
use App\Models\Common\ExamCollection;
use App\Models\Common\ExamTag;

/**
 * 试卷
 *
 * Class Collection
 * @package App\Models\Api\Exam
 */
class Collection extends ExamCollection
{
    protected $appends = [
        'score',
        'use_time',
        'use_time_minutes',
    ];

    public function tag()
    {
        return $this->belongsTo(ExamTag::class, 'exam_tag_uuid', 'uuid');
    }

    public function category()
    {
        return $this->belongsTo(ExamCategory::class, 'exam_category_uuid', 'uuid');
    }

    public function getScoreAttribute($key)
    {
        $examIdItems = CollectionRelation::query()->where('exam_collection_uuid', '=', $this->attributes['uuid'])->get(['exam_item_uuid']);

        if (!empty($examIdItems)) {
            $idArray = array_column($examIdItems->toArray(), 'exam_item_uuid');

            return Exam::query()->whereIn('uuid', $idArray)->sum('answer_income_score');
        }

        return 0.00;
    }


    public function getContentAttribute($key)
    {
        return empty($key) ? '' : $key;
    }

    public function getUseTimeAttribute($key)
    {
        if (!empty($this->attributes['exam_time'])) {
            $dataArray = explode(':', $this->attributes['exam_time']);

            return $dataArray[0] * 3600 + $dataArray[1] * 60 + $dataArray[2];
        }

        return 0;
    }

    public function getUseTimeMinutesAttribute($key)
    {
        if (!empty($this->attributes['exam_time'])) {
            $dataArray = explode(':', $this->attributes['exam_time']);

            return $dataArray[0] * 60 + $dataArray[1];
        }

        return 0;
    }
}
