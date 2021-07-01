<?php
declare(strict_types=1);

namespace App\Models\Common;

/**
 * 附件试题
 *
 * Class ExamRand
 * @package App\Models\Common
 */
class ExamRand extends BaseModel
{
    protected $table = 'exam_rand';

    public function getLinkAttribute($key)
    {
        return !empty($key) ? $key : '';
    }
}
