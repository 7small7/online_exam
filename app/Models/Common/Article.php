<?php
declare(strict_types=1);

namespace App\Models\Common;

/**
 * 文章
 *
 * Class Article
 * @package App\Models\Common
 */
class Article extends BaseModel
{
    protected $table = 'article';

    protected $fillable = [
        'id',
        'uuid',
        'article_category_uuid',
        'store_uuid',
        'title',
        'cover',
        'content',
        'publish_date',
        'author',
        'read_number',
        'orders',
        'is_show',
    ];
}
