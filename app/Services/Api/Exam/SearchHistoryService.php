<?php
declare(strict_types=1);

namespace App\Services\Api\Exam;


use App\Libs\UUID;
use App\Mapping\Cache\UserInfo;
use App\Repository\Api\Exam\SearchHistoryRepository;
use App\Services\Api\ApiServiceInterface;

/**
 * 搜索历史
 *
 * Class SearchHistoryService
 * @package App\Services\Api\Exam
 */
class SearchHistoryService implements ApiServiceInterface
{
    private $searchHistoryRepository;

    public function __construct()
    {
        $this->searchHistoryRepository = new SearchHistoryRepository;
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
            if (!empty($position)) {
                $query->where('position', '=', $position);
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
        $perSize = $requestParams['size'] ?? 10;

        return $this->searchHistoryRepository->repositorySelect(self::searchWhere((array)$requestParams), (int)$perSize);
    }

    /**
     * 创建数据
     *
     * @param array $requestParams 请求参数['title' => '搜索内容']
     * @return boolean true|false
     */
    public function serviceCreate(array $requestParams): bool
    {
        $historyInfo = [
            'uuid'             => UUID::getUUID(),
            'title'            => trim($requestParams['title']),
            'wechat_user_uuid' => UserInfo::getUserId(),
            'is_show'          => 1,
            'store_uuid'=>env('STORE_UUID'),
        ];
        $result      = $this->searchHistoryRepository->repositoryAdd($historyInfo);

        return $result ? true : false;
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
