import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:learn_bloc/lib.dart';

class DioClient {
  static Dio dioInit() {
    // final userCubit = sl<UserCubit>();

    return Dio()
      ..options = BaseOptions(
        headers: {
          'Accept': 'application/json',
        },
        connectTimeout: DurationConstant.networkConnectTimeout,
        sendTimeout: DurationConstant.networkSendTimeout,
        receiveTimeout: DurationConstant.networkReceiveTimeout,
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
