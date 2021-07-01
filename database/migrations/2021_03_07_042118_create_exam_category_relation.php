<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class CreateExamCategoryRelation extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('exam_category_relation', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->uuid('exam_category_uuid')->comment('分类id');
            $table->uuid('exam_item_uuid')->comment('试题id');
            $table->timestamps();
            $table->softDeletes();
        });
        $tablePrefix = env('DB_PREFIX', '');
        DB::select("alter table `{$tablePrefix}exam_category_relation`  comment '试题分类关联'");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('exam_category_relation');
    }
}
