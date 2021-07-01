<?php
declare(strict_types=1);

namespace App\Models\Admin\Exam;


use App\Models\Common\AdminBaseModel;

/**
 * 随机试题
 *
 * Class Rand
 * @package App\Models\Admin\Exam
 */
class Rand extends AdminBaseModel
{
    protected $table = 'exam_rand';

    public function setAttacheFileAttribute($pictures)
    {
        if (is_array($pictures)) {
            $this->attributes['attache_file'] = json_encode($pictures);
        }
    }

    public function getAttacheFileAttribute($pictures)
    {
        return json_decode($pictures, true);
    }
}
