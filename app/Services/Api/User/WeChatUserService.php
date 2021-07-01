<?php
declare(strict_types=1);

namespace App\Services\Api\User;

use App\Repository\Api\User\WeChatUserRepository;
use App\Services\Api\ApiServiceInterface;

/**
 * 微信小程序用户
 *
 * Class WeChatUserService
 * @package App\Services\Api\User
 */
class WeChatUserService implements ApiServiceInterface
{
    private $userRepository;

    public function __construct()
    {
        $this->userRepository = new WeChatUserRepository;
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
            if (!empty($openid)) {
                $query->where('openid', '=', $openid);
            }
            if (!empty($user_id)) {
                $query->where('uuid', '=', $user_id);
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
        // TODO: Implement serviceSelect() method.
    }

    /**
     * 创建数据
     *
     * @param array $requestParams 请求参数
     * @return boolean true|false
     */
    public function serviceCreate(array $requestParams): bool
    {
        return $this->userRepository->repositoryCreate((array)$requestParams);
    }

    /**
     * 更新数据
     *
     * @param array $requestParams 请求参数
     * @return int 更新行数
     */
    public function serviceUpdate(array $requestParams): int
    {
        $userId = $requestParams['user_id'];
        unset($requestParams['user_id']);

        return $this->userRepository->repositoryUpdate((array)['uuid' => $userId], (array)$requestParams);
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
        return $this->userRepository->repositoryFind(self::searchWhere((array)$requestParams));
    }
}
