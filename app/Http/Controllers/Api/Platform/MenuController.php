<?php
declare(strict_types = 1);

namespace App\Http\Controllers\Api\Platform;

use App\Http\Controllers\APiBaseController;
use App\Mapping\Response\ApiResponse;
use App\Services\Api\Platform\MenuService;
use Illuminate\Http\JsonResponse;

/**
 * 用户端菜单
 *
 * Class MenuController
 * @package App\Http\Controllers\Api\Platform
 */
class MenuController extends APiBaseController
{
    public function __construct(MenuService $apiService)
    {
        $this->service = $apiService;
        parent::__construct($apiService);
    }

    /**
     * 平台菜单
     *
     * @return JsonResponse
     */
    public function index()
    {
        $items = $this->service->serviceSelect((array)$this->requestParams);

        return ApiResponse::success((array)$items);
    }
}
