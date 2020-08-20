import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'infrastructore/core/interceptor/retry_interceptor.dart';
import 'infrastructore/core/secret_loader.dart';
import 'injection.dart';
import 'presentation/core/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.prod);
  getIt<SecretLoader>().init();
  Dio().interceptors.add(getIt<RetryOnConnectionChangeInterceptor>());
  runApp(AppWidget());
}
