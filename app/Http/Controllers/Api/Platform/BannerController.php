<?php
declare(strict_types = 1);

namespace App\Http\Controllers\Api\Platform;


use App\Http\Controllers\APiBaseController;
use App\Mapping\Response\ApiResponse;
use App\Services\Api\Platform\Banner;
use Illuminate\Http\JsonResponse;

/**
 * 轮播图
 *
 * Class BannerController
 * @package App\Http\Controllers\Api\Platform
 */
class BannerController extends APiBaseController
{
    public function __construct(Banner $apiService)
    {
        $this->service = $apiService;
        parent::__construct($apiService);
    }

    /**
     * 轮播图列表
     *
     * @return JsonResponse
     */
    public function index()
    {
        $items = $this->service->serviceSelect((array)$this->requestParams);

        return ApiResponse::success((array)$items);
    }
}
