<?php
declare(strict_types=1);

namespace App\Models\Common;

/**
 * 试题分类
 *
 * Class ExamCategory
 * @package App\Models\Common
 */
class ExamCategory extends BaseModel
{
    protected $table = 'exam_category';

    protected $fillable = [
        'uuid',
        'title',
        'parent_uuid',
        'remark',
        'is_show',
        'cover',
        'big_cover',
        'orders',
        'is_home',
        'store_uuid',
    ];

    public $searchFields = [
        'uuid',
        'title',
        'parent_uuid',
        'remark',
        'is_show',
        'cover',
        'big_cover',
        'orders',
        'is_home',
        'created_at',
        'updated_at',
    ];

    public function getBigCoverAttribute($key)
    {
        return env('QINIU_DMOAIN') . $key;
    }

    public function getParentUuidAttribute($key)
    {
        return empty($key) ? '' : $key;
    }
}
