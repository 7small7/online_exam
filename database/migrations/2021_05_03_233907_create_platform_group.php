<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class CreatePlatformGroup extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('platform_file_group', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->uuid('uuid')->comment('uuid');
            $table->string('title', 32)->comment('分组名称');
            $table->uuid('store_uuid')->comment('商户uuid');
            $table->string('parent_uuid', 32)->nullable()->comment('上级分类');
            $table->tinyInteger('is_show', false, true)->default(1)->comment('是否显示1是|0否');
            $table->timestamps();
        });
        $tablePrefix = env('DB_PREFIX', '');
        DB::select("alter table `{$tablePrefix}platform_file_group`  comment '平台文件组'");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('platform_file_group');
    }
}
