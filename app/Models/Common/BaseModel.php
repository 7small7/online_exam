<?php
declare(strict_types=1);

namespace App\Models\Common;


use App\Scopes\ApiIsStatusScope;
use App\Scopes\StoreScope;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Request;

/**
 * 模型基类
 *
 * Class BaseModel
 * @package App\Models\Common
 */
class BaseModel extends Model
{
    use SoftDeletes;

    protected static function boot()
    {
        $client = strtolower(Request::instance()->header('client-type', 'no'));
        if ($client == 'web_store' && Request::instance()->getUri() != 'store/login') {// 商户端web端
            static::addGlobalScope(new StoreScope());
        } else if ($client == 'api') {// 用户端移动端
            static::addGlobalScope(new ApiIsStatusScope());
        }

        parent::boot();
    }

    public function setStoreUuidAttribute($value)
    {
        $this->attributes['store_uuid'] = env('STORE_UUID');
    }

    public function getCoverAttribute($key)
    {
        if (!empty($this->attributes['cover'])) {
            return env('QINIU_DMOAIN') . $key;
        }
    }

    /**
     * 批量添加
     *
     * @param string $tableName 数据表名
     * @param array $info 插入的数据
     * @return bool
     * @author kert
     */
    public function batchAll(string $tableName, array $info): bool
    {
        $timeArray = [
            'created_at' => date('Y-m-d H:i:s'),
            'updated_at' => date('Y-m-d H:i:s'),
            'is_show'    => 1,
        ];
        array_walk($info, function (&$value, $key, $timeArray) {
            $value = array_merge($value, $timeArray);
        }, $timeArray);

        return DB::table($tableName)->insert($info);
    }


    /**
     * 忽略更新字段
     *
     * @param array $updatedFields
     * @return array
     * @author kert
     */
    public function updateIgnoreFields(array $updatedFields): array
    {
        unset($updatedFields['page']);
        unset($updatedFields['size']);
        unset($updatedFields['store_uuid']);
        unset($updatedFields['store_user_uuid']);

        return $updatedFields;
    }
}
