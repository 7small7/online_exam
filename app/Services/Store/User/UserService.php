<?php
declare(strict_types=1);

namespace App\Services\Store\User;


use App\Exceptions\DBException;
use App\Libs\UUID;
use App\Repository\Store\User\UserRepository;
use App\Services\Store\StoreServiceInterface;

/**
 * 商户
 *
 * Class UserService
 * @package App\Services\Store\User
 */
class UserService implements StoreServiceInterface
{
    private $userRepository;

    public function __construct()
    {
        $this->userRepository = new UserRepository;
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
            if (!empty($user_name)) {
                $query->where('username', '=', $user_name);
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
     * @throws DBException
     */
    public function serviceCreate(array $requestParams): bool
    {
        $passwordSlat                = md5(time() . mt_rand(1000, 9999));
        $requestParams['uuid']       = UUID::getUUID();
        $requestParams['store_uuid'] = UUID::getUUID();
        $requestParams['password']   = md5(base64_decode($requestParams['password']) . $passwordSlat);
        $requestParams['rand_slat']  = $passwordSlat;
        $result                      = $this->userRepository->repositoryCreate((array)$requestParams);

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
        return $this->userRepository->repositoryFind(self::searchWhere((array)$requestParams));
    }
}
