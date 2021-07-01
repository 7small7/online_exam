<?php
declare(strict_types = 1);

namespace App\Http\Controllers\Store\Platform;

use App\Http\Controllers\StoreAuthBaseController;
use App\Http\Requests\Common\UUIDValidate;
use App\Http\Requests\Store\Platform\FileValidate;
use App\Mapping\Response\ApiResponse;
use App\Services\Store\Platform\FileService;
use Illuminate\Http\JsonResponse;

/**
 * 文件
 *
 * Class FileController
 * @package App\Http\Controllers\Store\Store
 */
class FileController extends StoreAuthBaseController
{
    public function __construct(FileService $apiService)
    {
        $this->service = $apiService;
        parent::__construct($apiService);
    }

    /**
     * 文件列表
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
     * 创建文件
     *
     * @param FileValidate $fileValidate
     * @return JsonResponse
     * @author kert
     */
    public function store(FileValidate $fileValidate)
    {
        $result = $this->service->serviceCreate((array)$this->requestParams);

        return $result ? ApiResponse::success() : ApiResponse::error();
    }

    /**
     * 更新文件
     *
     * @param FileValidate $fileValidate
     * @return JsonResponse
     * @author kert
     */
    public function update(FileValidate $fileValidate)
    {
        $result = $this->service->serviceUpdate((array)$this->requestParams);

        return $result ? ApiResponse::success() : ApiResponse::error();
    }

    /**
     * 显示文件
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
     * 查询文件
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
