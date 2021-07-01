<?php


namespace App\Http\Controllers\Api\Common;


use App\Http\Controllers\APiBaseController;
use App\Mapping\Response\ApiResponse;
use App\Services\Api\Exam\ExamService;

/**
 * 试题
 *
 * Class Common
 * @package App\Http\Controllers\Api
 */
class ExamController extends APiBaseController
{
    public function __construct(ExamService $apiService)
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
