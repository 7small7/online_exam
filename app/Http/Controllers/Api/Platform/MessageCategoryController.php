<?php
declare(strict_types = 1);

namespace App\Http\Controllers\Api\Platform;

use App\Http\Controllers\APiAuthBaseController;
use App\Mapping\Response\ApiResponse;
use App\Services\Api\Platform\MessageCategory;
use Illuminate\Http\JsonResponse;

/**
 * 消息类型
 *
 * Class MessageCategoryController
 * @package App\Http\Controllers\Api\Platform
 */
class MessageCategoryController extends APiAuthBaseController
{
    public function __construct(MessageCategory $apiService)
    {
        $this->service = $apiService;
        parent::__construct($apiService);
    }

    /**
     * 消息中心列表
     *
     * @return JsonResponse
     */
    public function index()
    {
        $items = $this->service->serviceSelect((array)$this->requestParams);

        return ApiResponse::success((array)$items);
    }
}
