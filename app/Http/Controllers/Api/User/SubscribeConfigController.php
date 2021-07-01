<?php
declare(strict_types = 1);

namespace App\Http\Controllers\Api\User;

use App\Http\Controllers\APiBaseController;
use App\Mapping\Response\ApiResponse;
use App\Services\Api\User\SubscribeConfigService;
use Illuminate\Http\JsonResponse;

/**
 * 微信订阅消息配置
 *
 * Class SubscribeConfigController
 */
class SubscribeConfigController extends APiBaseController
{
    public function __construct(SubscribeConfigService $apiService)
    {
        $this->service = $apiService;
        parent::__construct($apiService);
    }

    /**
     * 订阅配置列表
     *
     * @return JsonResponse
     */
    public function index()
    {
        $items = $this->service->serviceSelect((array)$this->requestParams);

        return ApiResponse::success((array)$items);
    }
}
