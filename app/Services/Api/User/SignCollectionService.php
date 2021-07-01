<?php


namespace App\Services\Api\User;


use App\Libs\UUID;
use App\Repository\Api\User\SignCollectionRepository;
use App\Services\Api\ApiServiceInterface;

/**
 * 用户签到汇总
 *
 * Class SignCollectionService
 * @package App\Services\Api\User
 */
class SignCollectionService implements ApiServiceInterface
{
    private $signCollectionRepository;

    public function __construct()
    {
        $this->signCollectionRepository = new SignCollectionRepository;
    }

    /**
     * 格式化查询条件
     *
     * @param array $requestParams 请求参数
     * @return mixed 组装的查询条件
     */
    public static function searchWhere(array $requestParams)
    {
        // TODO: Implement searchWhere() method.
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
        return $this->signCollectionRepository->repositoryCreate((array)[
            'uuid'             => UUID::getUUID(),
            'wechat_user_uuid' => $requestParams['user_id'],
            'sign_number'      => 1,
            'is_show'          => 1,
        ]);
    }

    /**
     * 更新数据
     *
     * @param array $requestParams 请求参数
     * @return int 更新行数
     */
    public function serviceUpdate(array $requestParams): int
    {
        return $this->signCollectionRepository->repositoryUpdate(
            (array)['wechat_user_uuid' => $requestParams['user_id']],
            (array)['sign_number' => $requestParams['sign_number']
            ]);
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
        return $this->signCollectionRepository->repositoryFind(function ($query) use ($requestParams) {
            extract($requestParams);
            if (!empty($user_id)) {
                $query->where('wechat_user_uuid', '=', $user_id);
            }
        });
    }

    /**
     * 签到处理
     *
     * @param array $requestParams
     * @return bool
     */
    public function checkUserSign(array $requestParams): bool
    {
        $bean = $this->serviceFind((array)['user_id' => $requestParams['user_id']]);
        if (count($bean) < 1) {
            return $this->serviceCreate((array)[
                'user_id' => $requestParams['user_id'],
            ]);
        } else {
            return $this->serviceUpdate((array)[
                'user_id'     => $requestParams['user_id'],
                'sign_number' => $bean['sign_number'] + 1,
            ]);
        }
    }
}
