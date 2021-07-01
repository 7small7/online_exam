<?php
declare(strict_types=1);

namespace App\Http\Controllers\Common\Controller;

use App\Models\Common\ExamCollection;
use Illuminate\Http\Request;

/**
 * 管理端试卷
 *
 * Class CollectionController
 * @package App\Http\Controllers\Common\Controller
 */
class CollectionController
{
    public function index(Request $request)
    {
        $categoryUUid = $request->get('q', '48D1F5B7-5D95-9AC5-C5C7-7CA94AE46174');

        $items = ExamCollection::query()
            ->where([['exam_category_uuid', '=', $categoryUUid]])
            ->get(['uuid', 'title']);

        $data = [];

        if (!empty($items)) {
            $items = $items->toArray();

            foreach ($items as $key => $value) {
                $data[$key]['id']   = $value['uuid'];
                $data[$key]['text'] = $value['title'];
            }
        }

        return response()->json($data);
    }
}
