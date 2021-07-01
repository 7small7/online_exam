<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class CreateUserSignCollect extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('user_sign_collection', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->uuid('uuid');
            $table->uuid('wechat_user_uuid')->comment('用户id');
            $table->integer('sign_number', false, true)->comment('签到总天数');
            $table->tinyInteger('is_show', false, true)->default(1)->comment('是否显示1是|0否');
            $table->timestamps();
            $table->softDeletes();
        });

        $tablePrefix = env('DB_PREFIX', '');
        DB::select("alter table `{$tablePrefix}user_sign_collection`  comment '用户签到汇总'");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('user_sign_collect');
    }
}
