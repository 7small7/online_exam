<?php
declare(strict_types=1);

namespace App\Models\Common;

/**
 * 试题搜索历史
 *
 * Class ExamSearchHistory
 * @package App\Models\Common
 */
class ExamSearchHistory extends BaseModel
{
    protected $table = 'exam_search_history';

    protected $fillable = [
        'uuid',
        'title',
        'wechat_user_uuid',
        'is_show',
        'store_uuid',
    ];
}
