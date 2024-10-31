import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:qualifacts_case/networking/logging_interceptor.dart';
import 'package:qualifacts_case/services/storage_service/database.dart';

@module
abstract class AppConfigModule {
  @Singleton()
  AppDatabase get database => AppDatabase();

  @LazySingleton()
  Dio get dio {
    final client = Dio();
    client.options = BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    client.interceptors.add(LoggingInterceptors());
    return client;
  }
}