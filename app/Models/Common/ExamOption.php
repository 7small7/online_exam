<?php
declare(strict_types=1);

namespace App\Models\Common;

/**
 * 选择试题
 *
 * Class ExamOption
 * @package App\Models\Common
 */
class ExamOption extends BaseModel
{
    protected $table = 'exam_option';

    protected $fillable = [
        'uuid',
        'title',
        'cover',
        'answer',
        'analysis',
        'tips',
        'tips_expend_score',
        'answer_expend_score',
        'answer_income_score',
        'is_show',
        'options',
        'store_uuid',
    ];

    public $searchFields = [
        'uuid',
        'title',
        'cover',
        'answer',
        'analysis',
        'tips',
        'tips_expend_score',
        'answer_expend_score',
        'answer_income_score',
        'is_show',
        'options',
        'store_uuid',
        'created_at',
        'updated_at',
    ];
}
