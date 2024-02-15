import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static String baseUrl = 'https://emergingideas.ae/test_apis/';
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    ));
    //print('init: $dio/$baseUrl');
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    // String lang = 'en',
    // String? token,
  }) async {
    print('url: ${url}');
    // // return;
    // dio!.options.headers = {
    //   //'lang': lang,
    //   //'Authorization': 'Bearer ${token ?? CacheHelper.getData(key: "token")}',
    //   //'Content-Type': 'application/json',
    // };
    //print(dio!.options.headers);

    return await dio!.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? queryParameters,
    required Map<String, dynamic> data,
    // String lang = "en",
    String? token,
  }) async {
    print(data);
    // print('url->$url\n data->$data');
    return await dio!.post(
      url,
      queryParameters: queryParameters,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? queryParameters,
    required Map<String, dynamic> data,
    String lang = "en",
    //String? token,
  }) async {
    return await dio!.put(
      url,
      //queryParameters: queryParameters,
      data: data,
    );
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    String lang = "en",
    String? token,
  }) async {
    return await dio!.delete(
      url,
      //queryParameters: queryParameters,
      data: data,
    );
  }
}
