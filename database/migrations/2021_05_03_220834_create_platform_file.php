<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class CreatePlatformFile extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('platform_file', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->uuid('uuid')->comment('uuid');
            $table->uuid('store_uuid')->comment('商户uuid');
            $table->string('storage', 32)->comment('文件存储引擎方式');
            $table->string('file_url', 255)->comment('文件url');
            $table->string('file_name', 255)->comment('文件name');
            $table->integer('file_size', false, false)->comment('文件size');
            $table->string('file_type', 32)->comment('文件type');
            $table->string('extension', 32)->comment('文件扩展名');
            $table->tinyInteger('is_show', false, true)->default(1)->comment('是否显示1是|0否');
            $table->timestamps();
        });
        $tablePrefix = env('DB_PREFIX', '');
        DB::select("alter table `{$tablePrefix}platform_file`  comment '平台文件'");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('platform_file');
    }
}
