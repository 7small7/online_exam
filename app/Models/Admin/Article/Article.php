<?php
declare(strict_types = 1);

namespace App\Models\Admin\Article;


use App\Models\Common\AdminBaseModel;

/**
 * 文章
 *
 * Class Article
 * @package App\Models\Admin\Article
 */
class Article extends AdminBaseModel
{
    protected $table = 'article';

    public function category()
    {
        return $this->belongsTo(Category::class, 'article_category_uuid', 'uuid');
    }
}
