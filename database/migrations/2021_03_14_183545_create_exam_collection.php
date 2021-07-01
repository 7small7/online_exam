<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class CreateExamCollection extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('exam_collection', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->uuid('uuid');
            $table->string('title', 32)->comment('试题名称');
            $table->string('cover', 1000)->nullable()->comment('试题图片');
            $table->integer('submit_number', false, true)->comment('答题人数');
            $table->uuid('exam_tag_uuid')->comment('试卷标签');
            $table->uuid('exam_category_uuid')->comment('试卷标签');
            $table->time('exam_time')->comment('答题时间');
            $table->tinyInteger('is_recommend', false, true)->comment('是否推荐');
            $table->tinyInteger('is_show', false, true)->default(1)->comment('是否显示1是|0否');
            $table->timestamps();
            $table->softDeletes();
        });

        $tablePrefix = env('DB_PREFIX', '');
        DB::select("alter table `{$tablePrefix}exam_collection`  comment '试卷'");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('exam_collection');
    }
}
