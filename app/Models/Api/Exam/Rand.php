<?php
declare(strict_types=1);

namespace App\Models\Api\Exam;

use App\Models\Common\ExamRand;

/**
 * 随机试题
 *
 * Class Rand
 * @package App\Models\Api\Exam
 */
class Rand extends ExamRand
{
    public $searchFields = [
        'uuid',
        'title',
        'cover',
        'content',
        'author',
        'attache_file',
        'link',
        'read_number',
        'download_number',
        'created_at',
        'source',
    ];

    public function getAttacheFileAttribute($key)
    {
        if (!empty($this->attributes['attache_file'])) {
            $attacheFile = json_decode($this->attributes['attache_file'], true);
            if (!empty($attacheFile)) {
                foreach ($attacheFile as $key => $value) {
                    $attacheFile[$key] = env('QINIU_DMOAIN') . $value;
                }
            }

            return $attacheFile;
        }
    }


    public function getCreatedAtAttribute($key)
    {
        return date('Y-m-d', (int)strtotime($key));
    }
}
