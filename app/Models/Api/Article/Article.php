<?php
declare(strict_types = 1);

namespace App\Models\Api\Article;

use App\Libs\Functions\DataFormatter;
use App\Models\Common\Article as ArticleModel;

/**
 * 文章
 *
 * Class Article
 * @package App\Models\Api\Article
 */
class Article extends ArticleModel
{
    protected $casts = [
        'created_at' => 'datetime:Y-m-d',
    ];

    protected $appends = [
        'click_number'
    ];

    // 格式化发布日期
    public function getPublishDateAttribute($key)
    {
        $date = empty($key) ? $this->attributes['created_at'] : $key;

        return DataFormatter::formatterDate((string)$date);
    }

    // 点赞数
    public function getClickNumberAttribute($key)
    {
        return mt_rand(100, 999);
    }

    // 来源
    public function getSourceAttribute($key)
    {
        return !empty($key) ? $key : '暂无来源';
    }
}
