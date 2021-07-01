<?php
declare(strict_types=1);

namespace App\Models\Common;

use Illuminate\Database\Eloquent\Model;

/**
 * 试题知识点关联
 *
 * Class ExamTagRelation
 * @package App\Models\Common
 */
class ExamTagRelation extends Model
{
    protected $table = 'exam_tag_relation';

    protected $fillable = [
        'exam_tag_uuid',
        'exam_item_uuid',
        'store_uuid',
        'type',
    ];
}
