<?php


namespace App\Models\Api\Exam;


use Illuminate\Database\Eloquent\Model;

/**
 * 试题分类关联表
 *
 * Class ExamRelation
 * @package App\Models\Api\Exam
 */
class ExamRelation extends Model
{
    protected $table = 'exam_category_relation';

    public function exam()
    {
        return $this->hasMany(Exam::class, 'uuid', 'exam_item_uuid');
    }

    public function category()
    {
        return $this->belongsTo(Category::class, 'exam_category_uuid', 'uuid');
    }
}
