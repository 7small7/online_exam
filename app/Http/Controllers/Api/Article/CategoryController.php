<?php
declare(strict_types = 1);

namespace App\Http\Controllers\Api\Article;


use App\Http\Controllers\APiBaseController;
use App\Mapping\Response\ApiResponse;
use App\Services\Api\Article\CategoryService;
use Illuminate\Http\JsonResponse;

/**
 * 文章分类
 *
 * Class CategoryController
 * @package App\Http\Controllers\Api\Article
 */
class CategoryController extends APiBaseController
{
    public function __construct(CategoryService $apiService)
    {
        $this->service = $apiService;
        parent::__construct($apiService);
    }

    /**
     * 文章分类列表
     *
     * @return JsonResponse
     */
    public function index()
    {
        $items = $this->service->serviceSelect((array)$this->requestParams);

        return ApiResponse::success((array)$items);
    }
}
