<?php
declare(strict_types=1);

namespace App\Models\Common;

use Illuminate\Database\Eloquent\Model;

/**
 * 试题分类关联
 *
 * Class ExamCategoryRelation
 * @package App\Models\Common
 */
class ExamCategoryRelation extends Model
{
    protected $table = 'exam_category_relation';

    protected $fillable = [
        'exam_category_uuid',
        'exam_item_uuid',
        'store_uuid',
        'type',
    ];
}
