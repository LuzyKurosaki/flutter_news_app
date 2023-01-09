
import 'package:dio/dio.dart';

class ApiService {

  ApiService(
    baseUrl,{
      connectionTimeout = 3000,
      receiveTimeout = 3000
    }
  ){
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: connectionTimeout,
      receiveTimeout: receiveTimeout
    );
    _dio = Dio(options);
  }
  late Dio _dio;

  Future<Response<dynamic>> get(String url, {params}) async{
    try{
      return await _dio.get(url, queryParameters: params);
    }catch(_){
      throw Exception("Failed to fetch data");
    }
  }
}