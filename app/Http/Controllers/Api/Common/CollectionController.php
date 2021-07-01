<?php


namespace App\Http\Controllers\Api\Common;


use App\Http\Controllers\APiBaseController;
use App\Mapping\Response\ApiResponse;
use App\Services\Api\Exam\CollectionService;

/**
 * 试卷
 *
 * Class CollectionController
 * @package App\Http\Controllers\Api\Common
 */
class CollectionController extends APiBaseController
{
    public function __construct(CollectionService $apiService)
    {
        $this->service = $apiService;
        parent::__construct($apiService);
    }

    public function index()
    {
        $items = $this->service->serviceSelect((array)$this->requestParams);

        return ApiResponse::success((array)$items);
    }
}
