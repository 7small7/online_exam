<?php
declare(strict_types=1);

namespace App\Models\Common;

/**
 * 文章分类
 *
 * Class ArticleCategory
 * @package App\Models\Common
 */
class ArticleCategory extends BaseModel
{
    protected $table = 'article_category';

    protected $fillable = [
        'id',
        'uuid',
        'parent_uuid',
        'store_uuid',
        'title',
        'cover',
        'orders',
        'is_show',
    ];
}
