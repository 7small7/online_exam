<?php
declare(strict_types=1);

namespace App\Services\Api\Exam;


use App\Repository\Api\Exam\RandRepository;
use App\Services\Api\ApiServiceInterface;

/**
 * 附件试题
 *
 * Class RandService
 * @package App\Services\Api\Exam
 */
class RandService implements ApiServiceInterface
{
    private $randRepository;

    public function __construct()
    {
        $this->randRepository = new RandRepository;
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
            if (!empty($uuid)) {
                $query->where('uuid', '=', $uuid);
            }
            if (!empty($title)) {
                $query->where('title', 'like', '%' . $title . '%');
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
        return $this->randRepository->repositorySelect(self::searchWhere((array)$requestParams),
            (int)$requestParams['size'] ?? 20);
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
        return $this->randRepository->repositoryFind(self::searchWhere((array)$requestParams));
    }

    /**
     * 增加试题数量
     *
     * @param array $requestParams
     * @return bool
     * @author kert
     */
    public function incrNUmber(array $requestParams): bool
    {
        if (!empty($requestParams['filed']) && $requestParams['filed'] == 'read') {
            return $this->randRepository->incrNumber((array)[['uuid', '=', $requestParams['uuid']]], (array)[
                'field' => 'read_number',
                'value' => 1,
            ]);
        }

        if (!empty($requestParams['filed']) && $requestParams['filed'] == 'download') {
            return $this->randRepository->incrNumber((array)[['uuid', '=', $requestParams['uuid']]], (array)[
                'field' => 'download_number',
                'value' => 1,
            ]);
        }

        return true;
    }
}
