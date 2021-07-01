<?php
declare(strict_types = 1);

namespace App\Http\Controllers\Api\Platform;

use App\Http\Controllers\APiAuthBaseController;
use App\Mapping\Response\ApiResponse;
use App\Services\Api\Platform\MessageContent;
use Illuminate\Http\JsonResponse;

/**
 * 消息内容
 *
 * Class MessageCategoryController
 * @package App\Http\Controllers\Api\Platform
 */
class MessageContentController extends APiAuthBaseController
{
    public function __construct(MessageContent $apiService)
    {
        $this->service = $apiService;
        parent::__construct($apiService);
    }

    /**
     * 消息中心内容列表
     *
     * @return JsonResponse
     */
    public function index()
    {
        $items = $this->service->serviceSelect((array)$this->requestParams);

        return ApiResponse::success((array)$items);
    }

    /**
     * 消息中心内容详情
     *
     * @return JsonResponse
     */
    public function show()
    {
        $bean = $this->service->serviceFind((array)$this->requestParams);

        return ApiResponse::success((array)$bean);
    }
}
