import 'dart:io';
import 'package:TMDBFlutter/infrastructore/core/interceptor/dio_connectivity_request_retrier.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class RetryOnConnectionChangeInterceptor extends Interceptor {
  final DioConnectivityRequestRetrier requestRetrier;

  RetryOnConnectionChangeInterceptor(this.requestRetrier);
  @override
  Future onError(DioError err) async {
    if (_shouldRetry(err)) {
      try {
        return requestRetrier.scheduleRequestRetry(err.request);
      } catch (e) {
        return e;
      }
    }
    // Let the error "pass through" if it's not the error we're looking for
    return err;
  }

  bool _shouldRetry(DioError err) {
    return err.type == DioErrorType.DEFAULT && err.error != null && err.error is SocketException;
  }
}
