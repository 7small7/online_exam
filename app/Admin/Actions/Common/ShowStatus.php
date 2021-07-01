<?php

namespace App\Admin\Actions\Common;

use Encore\Admin\Actions\RowAction;
use Illuminate\Database\Eloquent\Model;

class ShowStatus extends RowAction
{
    public $name = '状态控制';

    public function handle(Model $model)
    {
        try {
            $status = $model->is_show == 1 ? 0 : 1;
            $msg    = $status == 1 ? '启用成功' : '禁用成功';
            if ($model->fillable(['is_show'])->update(['is_show' => $status])) {
                return $this->response()->success($msg)->refresh();
            } else {
                return $this->response()->error($msg)->refresh();
            }
        } catch (\Exception $exception) {
            return $this->response()->error($exception->getMessage())->refresh()->timeout(10);
        }
    }
}
