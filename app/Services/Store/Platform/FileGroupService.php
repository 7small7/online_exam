<?php
declare(strict_types=1);

namespace App\Services\Store\Platform;


use App\Libs\Functions\DataFormatter;
use App\Libs\UUID;
use App\Repository\Store\Platform\FileGroupRepository;
use App\Services\Store\StoreServiceInterface;

/**
 * 平台文件组
 *
 * Class FileGroupService
 * @package App\Services\Store\Platform
 */
class FileGroupService implements StoreServiceInterface
{
    private $fileGroupRepository;

    public function __construct()
    {
        $this->fileGroupRepository = new FileGroupRepository;
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
        $items   = $this->fileGroupRepository->repositorySelect(self::searchWhere((array)$requestParams), (int)$perSize);

        // 格式化数据
        $items['items'] = DataFormatter::recursionData((array)$items['items'], (string)'');

        return $items;
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
        $result                = $this->fileGroupRepository->repositoryCreate((array)$requestParams);

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
        return $this->fileGroupRepository->repositoryUpdate((array)[
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
        return $this->fileGroupRepository->repositoryDelete((array)$requestParams);
    }

    /**
     * 查询单条数据
     *
     * @param array $requestParams 请求参数
     * @return array 删除行数
     */
    public function serviceFind(array $requestParams): array
    {
        return $this->fileGroupRepository->repositoryFind(function ($query) use ($requestParams) {
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
