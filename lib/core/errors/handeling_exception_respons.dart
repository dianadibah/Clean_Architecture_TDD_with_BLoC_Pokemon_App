import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pokemon_app/core/errors/exceptions.dart';

mixin HandlingExceptionRequest {
  Exception getException({required Response response}) {
   final String message = json.decode(response.data);
    if (response.statusCode == 401) {
      return UnauthenticatedExeption();
    }
    return ServerException(message);
  }
}