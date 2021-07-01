<?php


namespace App\Http\Controllers;


use App\Services\Store\StoreServiceInterface;
use Illuminate\Support\Facades\Request;

/**
 * Store模块基类控制器
 *
 * Class APiBaseController
 * @package App\Http\Controllers
 */
class StoreBaseController extends Controller
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
     * @var StoreServiceInterface
     */
    protected $service;

    /**
     * 请求头信息
     *
     * @var array
     */
    protected $header = [];

    public function __construct(StoreServiceInterface $apiService)
    {
        $this->header        = Request::header();
        $this->requestParams = Request::all();
        $this->service       = $apiService;
    }

}
