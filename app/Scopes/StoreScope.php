<?php


namespace App\Scopes;


use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Scope;
use Illuminate\Support\Facades\Request;

/**
 * Api端查询显示字段作用域
 *
 * Class ApiScope
 * @package App\Scopes
 */
class StoreScope implements Scope
{
    public function apply(Builder $builder, Model $model)
    {
        $requestParams = Request::instance()->header();
        if (Request::instance()->getPathInfo() != '/store/login') {
            $builder->where([['store_uuid', '=', $requestParams['store-id']]]);
        }
    }
}
