import 'package:dio/dio.dart';

import '../constant/usecases.dart';
import '../errors/handeling_exception_respons.dart';

class WebServices with HandlingExceptionRequest{
  final Dio _dio;

  WebServices(this._dio);
  Future<BodyMap> get(
      {required String path, QueryParams? params}) async {
    var response = await _dio.get(
      path,
      queryParameters: params,
    );
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw getException(response: response);
    }
  }
}
