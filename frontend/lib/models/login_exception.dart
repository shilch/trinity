import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';

class LoginException implements Exception {
  final ErrorMessage errorMessage;

  LoginException(this.errorMessage);

  LoginException.fromDioException(DioError error)
      : errorMessage = standardSerializers.deserializeWith(
            ErrorMessage.serializer, error.response?.data)!;
}
