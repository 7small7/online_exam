<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class CreateArticle extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('article', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->uuid('uuid');
            $table->uuid('article_category_uuid')->comment('文章分类');
            $table->uuid('store_uuid')->comment('商户uuid');
            $table->string('title', 32)->comment('标题');
            $table->string('cover', 255)->comment('分类封面');
            $table->text('content')->comment('文章内容');
            $table->date('publish_date')->comment('发布日期');
            $table->string('author', 32)->comment('发布人');
            $table->string('source', 32)->nullable()->comment('发布人');
            $table->integer('read_number', false, true)->default(0)->comment('阅读数量');
            $table->integer('orders', false, true)->default(0)->comment('显示顺序');
            $table->tinyInteger('is_show', false, true)->default(1)->comment('是否显示1是|0否');
            $table->timestamps();
            $table->softDeletes();
        });
        $tablePrefix = env('DB_PREFIX', '');
        DB::select("alter table `{$tablePrefix}article`  comment '文章'");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('article');
    }
}
