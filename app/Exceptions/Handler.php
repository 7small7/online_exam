<?php

namespace App\Exceptions;

use App\Mapping\Response\ApiCode;
use App\Mapping\Response\ApiHttpCode;
use App\Mapping\Response\ApiResponse;
use Exception;
use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

class Handler extends ExceptionHandler
{
    /**
     * 响应异常到客户端
     *
     * @param Request $request
     * @param Exception $exception
     * @return JsonResponse|Response
     * @author kert
     */
    public function render($request, Exception $exception)
    {
        if ($exception instanceof NotFoundHttpException) {
            $message  = ApiHttpCode::getMessage((int)ApiHttpCode::URL_NOT_FUND);
            $httpCode = ApiHttpCode::URL_NOT_FUND;
        } elseif ($exception instanceof ValidationException) {
            $message  = $exception->validator->getMessageBag()->first();
            $httpCode = ApiHttpCode::FORBIDDEN;
        } elseif ($exception instanceof DBException) {
            $message  = $exception->getMessage();
            $httpCode = ApiHttpCode::SERVER_ERROR;
        } else {
            $message  = env('APP_DEBUG') ? $exception->getFile() . '第' . $exception->getLine() . '行' . $exception->getMessage() : $exception->getMessage();
            $httpCode = ApiHttpCode::SERVER_ERROR;
        }

        return ApiResponse::defineResponse(
            (int)ApiCode::ERROR,
            (string)$message,
            (array)[],
            (int)$httpCode
        );
    }
}
