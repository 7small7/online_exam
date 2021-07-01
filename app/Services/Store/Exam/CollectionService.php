<?php
declare(strict_types=1);

namespace App\Services\Store\Exam;


use App\Exceptions\DBException;
use App\Libs\UUID;
use App\Repository\Store\Exam\CollectionRepository;
use App\Services\Store\StoreServiceInterface;

/**
 * 试卷
 *
 * Class CollectionService
 * @package App\Services\Store\Exam
 */
class CollectionService implements StoreServiceInterface
{
    private $collectionRepository;

    public function __construct()
    {
        $this->collectionRepository = new CollectionRepository;
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

        return $this->collectionRepository->repositorySelect(self::searchWhere((array)$requestParams), (int)$perSize);
    }

    /**
     * 创建数据
     *
     * @param array $requestParams 请求参数
     * @return boolean true|false
     * @throws DBException
     */
    public function serviceCreate(array $requestParams): bool
    {
        $requestParams['uuid'] = UUID::getUUID();

        $createResult = $this->collectionRepository->repositoryCreate((array)$requestParams);

        return !empty($createResult) ? true : false;
    }

    /**
     * 更新数据
     *
     * @param array $requestParams 请求参数
     * @return int 更新行数
     * @throws DBException
     */
    public function serviceUpdate(array $requestParams): int
    {
        return $this->collectionRepository->repositoryUpdate((array)[
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
        return $this->collectionRepository->repositoryDelete((array)$requestParams);
    }

    /**
     * 查询单条数据
     *
     * @param array $requestParams 请求参数
     * @return array 删除行数
     */
    public function serviceFind(array $requestParams): array
    {
        return $this->collectionRepository->repositoryFind(function ($query) use ($requestParams) {
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
