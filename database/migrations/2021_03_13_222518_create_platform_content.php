<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class CreatePlatformContent extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('platform_content', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->uuid('uuid');
            $table->tinyInteger('position', false, true)->comment('显示位置');
            $table->text('content')->comment('文章内容');
            $table->tinyInteger('is_show', false, true)->default(1)->comment('是否显示1是|0否');
            $table->timestamps();
            $table->softDeletes();
        });

        $tablePrefix = env('DB_PREFIX', '');
        DB::select("alter table `{$tablePrefix}platform_content`  comment '平台文章'");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('platform_content');
    }
}
