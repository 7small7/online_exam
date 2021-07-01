<?php
declare(strict_types=1);

namespace App\Models\Common;

/**
 * 平台文件组
 *
 * Class PlatformFileGroup
 * @package App\Models\Common
 */
class PlatformFileGroup extends BaseModel
{
    protected $table = 'platform_file_group';

    protected $fillable = [
        'uuid',
        'store_uuid',
        'title',
        'parent_uuid',
        'is_show',
    ];

    public $searchFields = [
        'uuid',
        'store_uuid',
        'title',
        'parent_uuid',
        'is_show',
        'created_at',
        'updated_at',
    ];
}
