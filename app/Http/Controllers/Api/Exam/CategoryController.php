<?php
declare(strict_types = 1);

namespace App\Http\Controllers\Api\Exam;

use App\Http\Controllers\APiBaseController;
use App\Mapping\Response\ApiResponse;
use App\Services\Api\Exam\CategoryService;
use Illuminate\Http\JsonResponse;

/**
 * 试题分类
 *
 * Class CategoryController
 * @package App\Http\Controllers\Api\Exam
 */
class CategoryController extends APiBaseController
{
    public function __construct(CategoryService $apiService)
    {
        $this->service = $apiService;
        parent::__construct($apiService);
    }

    /**
     * 试卷分类列表
     *
     * @return JsonResponse
     */
    public function index()
    {
        $items = $this->service->serviceSelect((array)$this->requestParams);

        return ApiResponse::success((array)$items);
    }

    /**
     * 首页推荐分类
     *
     * @return JsonResponse
     */
    public function home()
    {
        $items = $this->service->serviceHomeSelect((array)['is_home' => 1, 'size' => 10]);

        return ApiResponse::success((array)$items);
    }
}
