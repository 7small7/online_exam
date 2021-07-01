<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class CreatePlatformMessageContent extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('platform_message_content', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->uuid('uuid');
            $table->uuid('platform_message_category_uuid')->comment('消息类型');
            $table->string('title', 32)->comment('消息标题');
            $table->text('content')->nullable()->comment('消息内容');
            $table->tinyInteger('is_show', false, true)->default(1)->comment('是否显示1是|0否');
            $table->timestamps();
            $table->softDeletes();
        });
        $tablePrefix = env('DB_PREFIX', '');
        DB::select("alter table `{$tablePrefix}platform_message_content`  comment '消息内容'");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('platform_message_content');
    }
}
