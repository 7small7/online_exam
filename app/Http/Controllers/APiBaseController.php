<?php


namespace App\Http\Controllers;


use App\Services\Api\ApiServiceInterface;
use Illuminate\Support\Facades\Request;

/**
 * Api模块基类控制器
 *
 * Class APiBaseController
 * @package App\Http\Controllers
 */
class APiBaseController extends Controller
{
    /**
     * 请求参数
     *
     * @var array
     */
    protected $requestParams = [];

    /**
     * 服务类
     *
     * @var ApiServiceInterface
     */
    protected $service;

    /**
     * 请求头信息
     *
     * @var array
     */
    protected $header = [];

    public function __construct(ApiServiceInterface $apiService)
    {
        $this->header        = Request::header();
        $this->requestParams = Request::all();
        $this->service       = $apiService;
    }

}
