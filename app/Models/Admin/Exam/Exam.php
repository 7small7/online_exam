<?php


namespace App\Models\Admin\Exam;


use App\Models\Common\AdminBaseModel;

/**
 * 试题管理
 *
 * Class Exam
 * @package App\Models\Admin\Exam
 */
class Exam extends AdminBaseModel
{
    protected $table = 'exam_option';

    protected $primaryKey = 'uuid';

    protected $keyType = 'string';

    public $incrementing = false;

    protected $casts = [
        'option' => 'json',
        'answer' => 'json'
    ];

    public function category()
    {
        return $this->belongsToMany(Category::class, 'exam_category_relation', 'exam_item_uuid', 'exam_category_uuid');
    }

    public function collection()
    {
        return $this->belongsToMany(Collection::class, 'collection_exam', 'exam_item_uuid', 'exam_collection_uuid');
    }

    // 试题与试卷关联
    public function examCategory()
    {
        return $this->hasMany(ExamCategoryRelation::class, 'exam_item_uuid', 'uuid');
    }

    public function getOptionAttribute($value)
    {
        return array_values(json_decode($value, true) ?: []);
    }

    public function setOptionAttribute($value)
    {
        $this->attributes['option'] = json_encode(array_values($value));
    }

    public function getAnswerAttribute($value)
    {
        return json_decode($value, true);
    }

    public function setAnswerAttribute($value)
    {
        $this->attributes['answer'] = json_encode($value);
    }

}
