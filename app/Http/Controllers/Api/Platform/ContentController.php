<?php
declare(strict_types = 1);

namespace App\Http\Controllers\Api\Platform;

use App\Http\Controllers\APiAuthBaseController;
use App\Mapping\Response\ApiResponse;
use App\Services\Api\Platform\ContentService;
use Illuminate\Http\JsonResponse;

/**
 * 平台内容
 *
 * Class ContentController
 * @package App\Http\Controllers\Api\Platform
 */
class ContentController extends APiAuthBaseController
{
    public function __construct(ContentService $apiService)
    {
        $this->service = $apiService;
        parent::__construct($apiService);
    }

    /**
     * 平台内容
     *
     * @return JsonResponse
     */
    public function index()
    {
        $bean = $this->service->serviceFind((array)$this->requestParams);

        return ApiResponse::success((array)$bean);
    }
}
