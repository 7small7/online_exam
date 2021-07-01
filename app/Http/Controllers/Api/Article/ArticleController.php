<?php
declare(strict_types = 1);

namespace App\Http\Controllers\Api\Article;


use App\Http\Controllers\APiBaseController;
use App\Mapping\Response\ApiResponse;
use App\Services\Api\Article\ArticleService;
use Illuminate\Http\JsonResponse;

/**
 * 文章
 *
 * Class ArticleController
 * @package App\Http\Controllers\Api\Article
 */
class ArticleController extends APiBaseController
{
    public function __construct(ArticleService $apiService)
    {
        $this->service = $apiService;
        parent::__construct($apiService);
    }

    /**
     * 文章列表
     *
     * @return JsonResponse
     */
    public function index()
    {
        $items = $this->service->serviceSelect((array)$this->requestParams);

        return ApiResponse::success((array)$items);
    }

    /**
     * 文章详情
     *
     * @return JsonResponse
     */
    public function show()
    {
        $bean = $this->service->serviceFind((array)$this->requestParams);

        return ApiResponse::success((array)$bean);
    }
}
