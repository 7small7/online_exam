<?php
declare(strict_types = 1);

namespace App\Http\Controllers\Store\Platform;

use App\Http\Controllers\StoreAuthBaseController;
use App\Http\Requests\Common\UUIDValidate;
use App\Http\Requests\Store\Platform\FileGroupValidate;
use App\Mapping\Response\ApiResponse;
use App\Services\Store\Platform\FileGroupService;
use Illuminate\Http\JsonResponse;

/**
 * 文件组
 *
 * Class FileGroupController
 * @package App\Http\Controllers\Store\Platform
 */
class FileGroupController extends StoreAuthBaseController
{
    public function __construct(FileGroupService $apiService)
    {
        $this->service = $apiService;
        parent::__construct($apiService);
    }

    /**
     * 文件组列表
     *
     * @return JsonResponse
     * @author kert
     */
    public function index()
    {
        $items = $this->service->serviceSelect((array)$this->requestParams);

        return ApiResponse::success((array)$items);
    }

    /**
     * 创建文件组
     *
     * @param FileGroupValidate $fileGroupValidate
     * @return JsonResponse
     * @author kert
     */
    public function store(FileGroupValidate $fileGroupValidate)
    {
        $result = $this->service->serviceCreate((array)$this->requestParams);

        return $result ? ApiResponse::success() : ApiResponse::error();
    }

    /**
     * 更新文件组
     *
     * @param FileGroupValidate $fileGroupValidate
     * @return JsonResponse
     * @author kert
     */
    public function update(FileGroupValidate $fileGroupValidate)
    {
        $result = $this->service->serviceUpdate((array)$this->requestParams);

        return $result ? ApiResponse::success() : ApiResponse::error();
    }

    /**
     * 显示文件组
     *
     * @param UUIDValidate $UUIDValidate
     * @return JsonResponse
     * @author kert
     */
    public function show(UUIDValidate $UUIDValidate)
    {
        $result = $this->service->serviceFind((array)$this->requestParams);

        return $result ? ApiResponse::success() : ApiResponse::error();
    }

    /**
     * 查询文件组
     *
     * @param UUIDValidate $UUIDValidate
     * @return JsonResponse
     * @author kert
     */
    public function destroy(UUIDValidate $UUIDValidate)
    {
        $result = $this->service->serviceDelete((array)$this->requestParams);

        return $result ? ApiResponse::success() : ApiResponse::error();
    }
}
