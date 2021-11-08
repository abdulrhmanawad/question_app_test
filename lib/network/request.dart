import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter_app_question/model/model_factory.dart';
import 'package:flutter_app_question/model/response_model.dart';

class Request{
  final String? base_url;
  Dio? _dio;
  Request(this.base_url){
    _dio=Dio(BaseOptions(baseUrl: base_url!));
  }
  Future<ResponseModel<T>> request<T>(String host,{String method="GET", dynamic queryParameters,dynamic data,bool? cache=false, Map<String,Object>? headers,Duration cacheDuration = const Duration(days: 1),
    Duration maxStale = const Duration(days: 30)})async{
    try {
      if(cache!){
        _dio?.interceptors.add(DioCacheManager(CacheConfig()).interceptor);
      }
      if(headers!=null){
        _dio?.options.headers=headers;
      }
      _dio?.options.method=method;
      final response=await _dio?.request(host,data: data,queryParameters: queryParameters,options: cache?buildCacheOptions(cacheDuration,maxStale: maxStale):null);
      return ResponseModel<T>(results:ModelFactory.generate<T>(response?.data),status_message: response?.statusMessage,status_code: response?.statusCode);
    } on DioError catch (e) {
      return ResponseModel(status_code:e.response?.statusCode??e.type.index ,status_message: e.message);
    }}
}