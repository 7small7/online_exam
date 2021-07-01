<?php
declare(strict_types=1);

namespace App\Http\Controllers\Store;


use App\Exceptions\DBException;
use App\Http\Controllers\StoreBaseController;
use App\Http\Requests\Store\User\LoginValidate;
use App\Http\Requests\Store\User\RegisterValidate;
use App\Libs\Cache\Redis\RedisConnection;
use App\Mapping\Cache\RedisCacheKey;
use App\Mapping\Response\ApiCode;
use App\Mapping\Response\ApiHttpCode;
use App\Mapping\Response\ApiResponse;
use App\Services\Store\User\UserService;
use Illuminate\Http\JsonResponse;

/**
 * 商户
 *
 * Class LoginController
 * @package App\Http\Controllers\Store
 */
class LoginController extends StoreBaseController
{
    public function __construct(UserService $apiService)
    {
        $this->service = $apiService;
        parent::__construct($apiService);
    }

    /**
     * 商户登录
     *
     * @param LoginValidate $loginValidate
     * @return JsonResponse
     * @author kert
     */
    public function login(LoginValidate $loginValidate)
    {
        $loginInfo = $this->service->serviceFind((array)$this->requestParams);
        if (!empty($loginInfo) && $loginInfo['password'] == md5(base64_decode($this->requestParams['password']) . $loginInfo['rand_slat'])) {
            $loginInfo['login_token'] = md5((string)time() . $loginInfo['uuid']);
            RedisConnection::getInstance()->set(
                RedisCacheKey::STORE_LOGIN_TOKEN . $loginInfo['login_token'],
                json_encode($loginInfo, JSON_UNESCAPED_UNICODE),
                'ex',
                RedisCacheKey::EXPIRE[RedisCacheKey::STORE_LOGIN_TOKEN]
            );
            unset($loginInfo['id'], $loginInfo['uuid'], $loginInfo['rand_slat'], $loginInfo['password']);
        } else {
            return ApiResponse::defineResponse((int)ApiCode::LOGIN_ERROR,
                (string)ApiCode::getMessage((int)ApiCode::LOGIN_ERROR),
                (array)$loginValidate->validated(), (int)ApiHttpCode::SUCCESS);
        }

        return ApiResponse::success((array)$loginInfo);
    }

    /**
     * 商户注册
     *
     * @param RegisterValidate $registerValidate
     * @return JsonResponse
     * @throws DBException
     * @author kert
     */
    public function register(RegisterValidate $registerValidate)
    {
        $bean = $this->service->serviceCreate((array)$this->requestParams);

        return $bean ? ApiResponse::success() : ApiResponse::error();
    }
}
