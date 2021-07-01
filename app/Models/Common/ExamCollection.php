<?php
declare(strict_types=1);

namespace App\Models\Common;


/**
 * 试卷
 *
 * Class ExamCollection
 * @package App\Models\Common
 */
class ExamCollection extends BaseModel
{
    protected $table = 'exam_collection';

    protected $fillable = [
        'uuid',
        'title',
        'cover',
        'submit_number',
        'exam_tag_uuid',
        'exam_category_uuid',
        'exam_time',
        'is_recommend',
        'is_show',
        'content',
        'level',
        'store_uuid',
        'author',
        'audit_author',
    ];

    public $searchFields = [
        'uuid',
        'title',
        'cover',
        'submit_number',
        'exam_tag_uuid',
        'exam_category_uuid',
        'exam_time',
        'is_recommend',
        'is_show',
        'content',
        'level',
        'store_uuid',
        'author',
        'audit_author',
        'created_at',
        'updated_at',
    ];
}
