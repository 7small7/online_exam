<?php


namespace App\Models\Api\Exam;


use App\Models\Common\ExamOption;

/**
 * 选择题
 *
 * Class Exam
 * @package App\Models\Api\Exam
 */
class Exam extends ExamOption
{
    protected $casts = [
        'option' => 'array',
    ];

    public function collectionExamRelation()
    {
        return $this->hasMany(CollectionRelation::class, 'exam_item_uuid', 'uuid');
    }

    public function getAnswerAttribute($key)
    {
        return json_decode($key, true)[0];
    }

    public function getAnalysisAttribute($key)
    {
        return empty($key) ? '' : $key;
    }

    public function getTipsAttribute($key)
    {
        return empty($key) ? '' : $key;
    }

    public function getCoverAttribute($key)
    {
        if (!empty($this->attributes['cover'])) {
            return env('QINIU_DMOAIN') . $key;
        }

        return '';
    }
}
