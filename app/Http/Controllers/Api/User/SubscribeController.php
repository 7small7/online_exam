<?php
declare(strict_types = 1);

namespace App\Http\Controllers\Api\User;

use App\Http\Controllers\APiAuthBaseController;
use App\Mapping\Response\ApiResponse;
use App\Services\Api\User\WeChatUserSubscribeService;
use Illuminate\Http\JsonResponse;

/**
 * 微信用户订阅消息
 *
 * Class SubscribeController
 * @package App\Http\Controllers\Api\User
 */
class SubscribeController extends APiAuthBaseController
{
    public function __construct(WeChatUserSubscribeService $apiService)
    {
        $this->service = $apiService;
        parent::__construct($apiService);
    }

    /**
     * 用户消息订阅存储
     *
     * @return JsonResponse
     */
    public function store()
    {
        $this->service->serviceCreate((array)$this->requestParams);

        return ApiResponse::success();
    }
}
