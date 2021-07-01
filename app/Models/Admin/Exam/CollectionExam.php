<?php


namespace App\Models\Admin\Exam;


use App\Models\Common\AdminBaseModel;

/**
 * 试卷与试题关联
 *
 * Class CollectionExam
 * @package App\Models\Admin\Exam
 */
class CollectionExam extends AdminBaseModel
{
    protected $table = 'collection_exam';

    protected $fillable = [
        'exam_collection_uuid',
        'exam_item_uuid',
    ];
}
