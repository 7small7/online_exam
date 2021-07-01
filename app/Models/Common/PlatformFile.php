<?php
declare(strict_types=1);

namespace App\Models\Common;

/**
 * 平台文件
 *
 * Class PlatformFile
 * @package App\Models\Common
 */
class PlatformFile extends BaseModel
{
    protected $table = 'platform_file';

    protected $fillable = [
        'uuid',
        'store_uuid',
        'storage',
        'file_url',
        'file_name',
        'file_size',
        'file_type',
        'extension',
        'is_show',
    ];

    public $searchFields = [
        'uuid',
        'store_uuid',
        'storage',
        'file_url',
        'file_name',
        'file_size',
        'file_type',
        'extension',
        'is_show',
        'created_at',
        'updated_at',
    ];
}
