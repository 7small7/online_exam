<?php

namespace App\Admin\Actions\Exam;

use App\Models\Admin\Exam\Collection;
use App\Models\Admin\Exam\CollectionExam as CollectionExamModel;
use Encore\Admin\Actions\RowAction;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Request as RequestFacades;

class CollectionExamBind extends RowAction
{
    public $name = '绑定试题';

    public function handle(Model $model, Request $request)
    {
        $collectionUUID = $request->get('collection_uuid');
        $uuid           = $request->get('uuid');
        $isChecked      = $request->get('is_checked', 0);
        if ($isChecked == 0) {
            CollectionExamModel::query()->where([
                ['exam_collection_uuid', '=', $collectionUUID],
                ['exam_item_uuid', '=', $uuid]
            ])->delete();
        }

        if ($isChecked == 1) {
            CollectionExamModel::query()->updateOrCreate([
                'exam_collection_uuid' => $collectionUUID,
                'exam_item_uuid'       => $uuid,
            ], [
                'exam_collection_uuid' => $collectionUUID,
                'exam_item_uuid'       => $uuid,
                'store_uuid'           => env('STORE_UUID'),
            ]);
        }

        return $this->response()->success('绑定成功')->refresh();
    }


    public function form()
    {
        $examUUID = $this->getKey();
        /** @var string $collectionId 试卷id */
        $collectionId = RequestFacades::instance()->get('collection_id');

        $collectionItems = Collection::query()
            ->where([['uuid', '=', $collectionId]])
            ->get(['uuid', 'title'])
            ->toArray();

        $arrayKeys  = array_column($collectionItems, 'uuid');
        $arrayTitle = array_column($collectionItems, 'title');
        $this->select('is_checked', '关联设置')->options([0 => '取消绑定', 1 => '添加绑定'])
            ->default(1)->required();
        $this->select('collection_uuid', '相关试卷')->options(array_combine($arrayKeys, $arrayTitle))
            ->default($collectionId)->readonly();
        $this->text('uuid', '试题UUID')->default($examUUID)->readonly();
    }

}
