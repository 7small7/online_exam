<?php
declare(strict_types=1);

namespace App\Models\Common;

/**
 * 平台配置
 *
 * Class PlatformSetting
 * @package App\Models\Common
 */
class PlatformSetting extends BaseModel
{
    protected $table = 'platform_setting';

    protected $fillable = [
        'uuid',
        'title',
        'type',
        'values',
        'store_uuid',
        'is_show',
    ];

    public $searchFields = [
        'uuid',
        'title',
        'type',
        'values',
        'store_uuid',
        'is_show',
        'created_at',
        'updated_at',
    ];

    public function getValuesAttribute($key)
    {
        return json_decode($key, true);
    }
}
