<?php


namespace App\Http\Controllers;


use App\Libs\Cache\Redis\RedisConnection;
use App\Mapping\Cache\RedisCacheKey;
use App\Mapping\Response\ApiCode;
use App\Mapping\Response\ApiHttpCode;
use App\Mapping\Response\ApiResponse;
use App\Services\Store\StoreServiceInterface;
use Illuminate\Support\Facades\Request;

/**
 * Api模块鉴权基类控制器
 *
 * Class APiBaseController
 * @package App\Http\Controllers
 */
class StoreAuthBaseController extends Controller
{
    /**
     * 请求参数
     *
     * @var array
     */
    protected $requestParams = [];

    /**
     * 服务类
     *
     * @var StoreServiceInterface
     */
    protected $service;

    /**
     * 登录token
     *
     * @var string
     */
    protected $loginToken = '';

    /**
     * 用户消息
     *
     * @var array
     */
    protected $userInfo = [];

    /**
     * 用户id
     *
     * @var string
     */
    protected $userId = '';

    /**
     * 请求头信息
     *
     * @var array
     */
    protected $header = [];

    public function __construct(StoreServiceInterface $apiService)
    {
        $this->header     = Request::header();
        $this->loginToken = Request::header('Authentication', '');
        $userInfo         = RedisConnection::getInstance()->get(RedisCacheKey::STORE_LOGIN_TOKEN . $this->loginToken);
        if (!empty($userInfo)) {
            $userInfo                               = json_decode($userInfo, true);
            $this->requestParams                    = Request::all();
            $this->service                          = $apiService;
            $this->requestParams['store_user_uuid'] = $userInfo['uuid'];// 商户用户uuid
            $this->requestParams['store_uuid']      = $userInfo['store_uuid'];// 商户uuid
            $this->userInfo                         = $userInfo;
            $this->userId                           = $userInfo['uuid'];
        }

        return ApiResponse::defineResponse(
            (int)ApiCode::LOGIN_NOT_FUND,
            (string)ApiCode::getMessage(ApiCode::LOGIN_NOT_FUND),
            (array)[],
            (int)ApiHttpCode::NO_AUTH
        );
    }

}
