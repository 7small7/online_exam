<?php
declare(strict_types=1);

namespace App\Models\Api\Platform;

use App\Models\Common\Menu as MenuModel;

/**
 * 用户端菜单
 *
 * Class Menu
 * @package App\Models\Api\Platform
 */
class Menu extends MenuModel
{
    public $searchFields = [
        'uuid',
        'title',
        'cover',
        'type',
        'url',
        'position',
    ];
}
