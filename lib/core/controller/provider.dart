import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:prueba_tecnica_bia/data/data.dart';

final Dio _dio = Dio();

final apiProvider = Provider<MarvelRepository>((ref) {
  _dio.interceptors.add(PrettyDioLogger());
  return MarvelApi(dio: _dio);
});
