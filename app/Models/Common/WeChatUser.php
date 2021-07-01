<?php
declare(strict_types=1);

namespace App\Models\Common;

/**
 * 用户用户
 *
 * Class WeChatUser
 * @package App\Models\Common
 */
class WeChatUser extends BaseModel
{
    protected $table = 'wechat_user';

    protected $fillable = [
        'openid',
        'nickname',
        'avatar_url',
        'gender',
        'country',
        'province',
        'city',
        'uuid',
        'language',
        'real_name',
        'mobile',
        'address',
        'longitude',
        'latitude',
        'birthday',
        'store_uuid',
    ];

    // 语言
    public function getLanguageAttribute($key)
    {
        return empty($key) ? '' : $key;
    }

    // 国家
    public function getCountryAttribute($key)
    {
        return empty($key) ? '' : $key;
    }

    // 省
    public function getProvinceAttribute($key)
    {
        return empty($key) ? '' : $key;
    }

    // 市
    public function getCityAttribute($key)
    {
        return empty($key) ? '' : $key;
    }

    // 区
    public function getDistrictAttribute($key)
    {
        return empty($key) ? '' : $key;
    }

    // 详细地址
    public function getAddressAttribute($key)
    {
        return empty($key) ? '' : $key;
    }

    // 性别
    public function getGenderAttribute($key)
    {
        switch ($key) {
            case 0:
                return '未知';
                break;
            case 1:
                return '男';
                break;
            case 2:
                return '女';
                break;
            default:
                return '未知';
        }
    }
}
