import 'dart:io';

import 'package:dio/dio.dart';
import 'package:poke_test/domain/common/errors/bad_request.dart';
import 'package:poke_test/domain/common/errors/no_network.dart';
import 'package:poke_test/domain/common/errors/unatuthorized.dart';
import 'package:poke_test/domain/common/errors/unexpected.dart';

class ErrorMapping {
  toThrow(dynamic error) {
    if (error is DioError) {
      var response = error.response;
      var statusCode = response?.statusCode;
      if (error.type == DioErrorType.other || error.error is SocketException) {
        throw NoNetwork();
      }
      switch (statusCode) {
        case 400:
          throw BadRequest();
        case 401:
          throw Unauthorized();
        case 404:
          throw Unauthorized();
        default:
          throw BadRequest();
      }
    } else {
      throw Unexpected();
    }
  }
}
