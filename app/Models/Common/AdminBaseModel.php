<?php


namespace App\Models\Common;

use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Foundation\Auth\User as AuthenticTable;
use Illuminate\Notifications\Notifiable;

/**
 * 管理端模型基类
 *
 * Class AdminBaseModel
 * @package App\Models\Common
 */
class AdminBaseModel extends AuthenticTable
{
    use SoftDeletes;

    use Notifiable;

    protected $primaryKey = 'id';
}
