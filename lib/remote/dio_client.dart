import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioClient {
  static Dio dioInit() {
    // final userCubit = sl<UserCubit>();

    return Dio()
      ..options = BaseOptions(
        headers: {
          'Accept': 'application/json',
        },
        connectTimeout: Duration.millisecondsPerSecond * 15,
        sendTimeout: Duration.millisecondsPerSecond * 15,
        receiveTimeout: Duration.millisecondsPerSecond * 15,
      )
      ..interceptors.addAll([
        // Show log network request in debug console [only in debug mode]
        if (kDebugMode)
          LogInterceptor(
            requestBody: true,
            responseBody: true,
            logPrint: (message) => log(message.toString()),
          ),
        // CustomInterceptor()
      ]);
  }
}
