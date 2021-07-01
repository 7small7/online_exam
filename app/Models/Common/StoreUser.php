<?php
declare(strict_types=1);

namespace App\Models\Common;

/**
 * 商户
 *
 * Class StoreUser
 * @package App\Models\Common
 */
class StoreUser extends BaseModel
{
    protected $table = 'store_user';

    public $fillable = [
        'name',
        'email',
        'email_verified_at',
        'password',
        'remember_token',
        'uuid',
        'mobile',
        'rand_slat',
        'store_uuid',
    ];

    /**
     * 查询字段
     *
     * @var array
     */
    public $searchFields = [
        'name',
        'mobile',
        'email',
        'password',
        'uuid',
        'rand_slat',
        'store_uuid',
    ];

    public function getEmailAttribute($key)
    {
        return empty($key) ? '' : $key;
    }
}
