// shared/network/remote/dio_helper.dart
import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

 static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://fakestoreapi.com/', // خلي بالك من "/v2/"
        receiveDataWhenStatusError: true,
      ),
    );
  }


  static Future<Response> getDate({
    required String url,
    Map<String , dynamic>? query,
  }) async
  {
    return await dio!.get(
      url,
      queryParameters: query, //معاملات مرسلة مع الرابط 
    );
  }

  static Future<Response> postDate({
    required String url,
     Map<String , dynamic>? query,
    required Map<String, dynamic> data,

  }) async
  {
    dio?.options.headers =
    {
      'Content-Type': 'application/json',
    };

    return await dio!.get(
      url,
      queryParameters: query, // بارامترات اختيارية في الرابط
      data: data,
    );
  }
}