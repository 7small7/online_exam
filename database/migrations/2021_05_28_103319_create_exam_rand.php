<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class CreateExamRand extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('exam_rand', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->uuid('uuid');
            $table->uuid('store_uuid')->comment('商户uuid');
            $table->string('title', 32)->comment('标题');
            $table->json('cover')->nullable()->comment('分类封面');
            $table->text('content')->comment('文章内容');
            $table->string('author', 32)->comment('发布人');
            $table->string('source', 32)->comment('信息来源');
            $table->json('attache_file')->comment('试题图片');
            $table->string('link', 1000)->nullable()->comment('相关链接');
            $table->integer('read_number', false, true)->default(0)->comment('阅读数量');
            $table->integer('download_number', false, true)->default(0)->comment('下载数量');
            $table->integer('orders', false, true)->default(0)->comment('显示顺序');
            $table->tinyInteger('is_show', false, true)->default(1)->comment('是否显示1是|0否');
            $table->timestamps();
            $table->softDeletes();
        });

        $tablePrefix = env('DB_PREFIX', '');
        DB::select("alter table `{$tablePrefix}exam_rand`  comment '附件形式的试题'");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('exam_rand');
    }
}
