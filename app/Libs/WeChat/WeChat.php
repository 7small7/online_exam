<?php
declare(strict_types=1);

namespace App\Libs\WeChat;


use App\Libs\Cache\Redis\RedisConnection;
use GuzzleHttp\Client;
use GuzzleHttp\Exception\GuzzleException;

/**
 * 微信小程序请求类库
 *
 * Class WeChat
 * @package App\Libs\WeChat
 */
class WeChat
{
    private $appKey = '';

    private $appSecret = '';

    public function __construct()
    {
        $this->appKey    = config('third.wechat.key');
        $this->appSecret = config('third.wechat.secret');
    }

    /**
     * 获取微信session_key
     *
     * @param $code
     * @return array
     * @author kert
     */
    public function getSessionKey($code): array
    {
        $param   = array();
        $param[] = 'appid=' . $this->appKey;
        $param[] = 'secret=' . $this->appSecret;
        $param[] = 'js_code=' . $code;
        $param[] = 'grant_type=authorization_code';
        $params  = implode('&', $param);

        $url    = 'https://api.weixin.qq.com/sns/jscode2session' . '?' . $params;
        $client = new Client([
            'timeout' => 60
        ]);
        try {
            $response = json_decode($client->get($url)->getBody()->getContents(), true);
            if (!isset($response['errcode']) || $response['errcode'] == 0) {
                $msg  = '';
                $data = $response;
                $code = 0;
            } else {
                $msg  = $response['errmsg'];
                $data = [];
                $code = $response['errcode'];
            }
        } catch (GuzzleException $e) {
            // TODO 记录错误日志信息
            $msg  = $e->getMessage();
            $code = -2;
            $data = [];
        }
        return [
            'code' => $code,
            'msg'  => $msg,
            'data' => $data,
        ];
    }

    /**
     * 获取微信access_token
     *
     * @return string
     * @author kert
     */
    public function getAccessToken(): string
    {
        $accessToken = RedisConnection::getInstance()->get('access:token');
        if (empty($accessToken)) {
            $client = new Client([
                'timeout' => 60
            ]);
            try {
                $url      = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=" . $this->appKey . "&secret=" . $this->appSecret . "";
                $response = $client->get($url)->getBody()->getContents();
                $response = json_decode($response, true);
                if (!isset($response['errcode'])) {
                    RedisConnection::getInstance()->set('access:token', $response['access_token'], 'ex', 7200);
                    $accessToken = $response['access_token'];
                }
            } catch (GuzzleException $exception) {
                // TODO 记录错误日志信息
            }
        }

        return empty($accessToken) ? '' : $accessToken;
    }
}
