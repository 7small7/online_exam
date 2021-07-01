<?php

namespace App\Admin\Actions\Exam;

use Encore\Admin\Actions\BatchAction;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Support\Facades\Request as RequestFacades;


class CollectionExamBatchBind extends BatchAction
{
    public $name = '批量绑定';

    public function handle(Collection $collection)
    {
        var_dump(RequestFacades::instance()->all());
        die();
        foreach ($collection as $model) {
            // ...
        }

        return $this->response()->success('Success message...')->refresh();
    }

}
