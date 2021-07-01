<?php
declare(strict_types=1);

namespace App\Services\Store\Platform;


use App\Libs\UUID;
use App\Repository\Store\Platform\SettingRepository;
use App\Services\Store\StoreServiceInterface;

/**
 * 平台配置
 *
 * Class SettingService
 * @package App\Services\Store\Platform
 */
class SettingService implements StoreServiceInterface
{
    private $settingRepository;

    public function __construct()
    {
        $this->settingRepository = new SettingRepository;
    }

    /**
     * 格式化查询条件
     *
     * @param array $requestParams 请求参数
     * @return mixed 组装的查询条件
     */
    public static function searchWhere(array $requestParams)
    {
        return function ($query) use ($requestParams) {
            extract($requestParams);
            if (!empty($store_uuid)) {
                $query->where('store_uuid', '=', $store_uuid);
            }
        };
    }

    /**
     * 查询数据
     *
     * @param array $requestParams 请求参数
     * @return array 查询结果
     */
    public function serviceSelect(array $requestParams): array
    {
        $perSize = $requestParams['size'] ?? 20;

        return $this->settingRepository->repositorySelect(self::searchWhere((array)$requestParams), (int)$perSize);
    }

    /**
     * 创建数据
     *
     * @param array $requestParams 请求参数
     * @return boolean true|false
     */
    public function serviceCreate(array $requestParams): bool
    {
        $requestParams['uuid'] = UUID::getUUID();
        $result                = $this->settingRepository->repositoryCreate((array)$requestParams);

        return !empty($result) ? true : false;
    }

    /**
     * 更新数据
     *
     * @param array $requestParams 请求参数
     * @return int 更新行数
     */
    public function serviceUpdate(array $requestParams): int
    {
        return $this->settingRepository->repositoryUpdate((array)[
            ['uuid', '=', $requestParams['uuid']],
            ['store_uuid', '=', $requestParams['store_uuid']]
        ], (array)$requestParams);
    }

    /**
     * 删除数据
     *
     * @param array $requestParams 请求参数
     * @return int 删除行数
     */
    public function serviceDelete(array $requestParams): int
    {
        return $this->settingRepository->repositoryDelete((array)$requestParams);
    }

    /**
     * 查询单条数据
     *
     * @param array $requestParams 请求参数
     * @return array 删除行数
     */
    public function serviceFind(array $requestParams): array
    {
        return $this->settingRepository->repositoryFind(function ($query) use ($requestParams) {
            extract($requestParams);
            if (!empty($uuid)) {
                $query->where('uuid', '=', $requestParams['uuid']);
            }
            if (!empty($store_uuid)) {
                $query->where('store_uuid', '=', $store_uuid);
            }
        });
    }
}
