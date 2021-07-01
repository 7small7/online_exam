<?php


namespace App\Services\Api\Exam;


use App\Repository\Api\Exam\ExamRepository;
use App\Services\Api\ApiServiceInterface;

/**
 * 试题
 *
 * Class ExamService
 * @package App\Services\Api\Exam
 */
class ExamService implements ApiServiceInterface
{
    private $examRepository;

    public function __construct()
    {
        $this->examRepository = new ExamRepository;
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
        $perSize = $requestParams['size'] ?? 100;

        return $this->examRepository->repositorySelect(self::searchWhere((array)$requestParams), (int)$perSize);
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

    /**
     * 通过试卷查询试题
     *
     * @param array $requestParams
     * @return array
     */
    public function serviceSelectByCollection(array $requestParams): array
    {
        $perSize = $requestParams['size'] ?? 100;

        return $this->examRepository->repositorySelectByCollection((array)['exam_collection_uuid' => $requestParams['exam_collection_uuid']], (int)$perSize);
    }

    /**
     * 通过ID查询所有的试题信息
     *
     * @param array $idArray
     * @return array
     */
    public function serviceSelectAll(array $idArray): array
    {
        return $this->examRepository->repositorySelectAllByIn((array)$idArray, (string)'uuid');
    }
}
