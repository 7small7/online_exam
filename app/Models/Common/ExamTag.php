<?php
declare(strict_types=1);

namespace App\Models\Common;

/**
 * 知识点
 *
 * Class ExamTag
 * @package App\Models\Common
 */
class ExamTag extends BaseModel
{
    protected $table = 'tag';

    protected $fillable = [
        'uuid',
        'title',
        'remark',
        'is_show',
        'store_uuid',
        'parent_uuid',
        'orders',
    ];

    public $searchFields = [
        'uuid',
        'title',
        'remark',
        'is_show',
        'store_uuid',
        'parent_uuid',
        'created_at',
        'orders',
    ];
}
