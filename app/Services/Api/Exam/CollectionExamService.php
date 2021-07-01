<?php
declare(strict_types=1);

namespace App\Services\Api\Exam;


use App\Repository\Api\Exam\CollectionExamRepository;
use App\Services\Api\ApiServiceInterface;

/**
 * 试卷试题
 *
 * Class CollectionExamService
 * @package App\Services\Api\Exam
 */
class CollectionExamService implements ApiServiceInterface
{
    private $collectionExamRepository;

    public function __construct()
    {
        $this->collectionExamRepository = new CollectionExamRepository;
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
            if (!empty($exam_collection_uuid)) {
                $query->where('exam_collection_uuid', $exam_collection_uuid);
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
        $perSize = 100;

        return $this->collectionExamRepository->repositorySelect(self::searchWhere((array)$requestParams), (int)$perSize);
    }

    /**
     * 创建数据
     *
     * @param array $requestParams 请求参数
     * @return boolean true|false
     */
    public function serviceCreate(array $requestParams): bool
    {
        // TODO: Implement serviceCreate() method.
    }

    /**
     * 更新数据
     *
     * @param array $requestParams 请求参数
     * @return int 更新行数
     */
    public function serviceUpdate(array $requestParams): int
    {
        // TODO: Implement serviceUpdate() method.
    }

    /**
     * 删除数据
     *
     * @param array $requestParams 请求参数
     * @return int 删除行数
     */
    public function serviceDelete(array $requestParams): int
    {
        // TODO: Implement serviceDelete() method.
    }

    /**
     * 查询单条数据
     *
     * @param array $requestParams 请求参数
     * @return array 删除行数
     */
    public function serviceFind(array $requestParams): array
    {
        // TODO: Implement serviceFind() method.
    }
}
