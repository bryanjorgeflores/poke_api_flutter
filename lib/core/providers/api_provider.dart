import 'dart:io';

import 'package:dio/dio.dart';

class ApiProvider {
  Dio api = Dio();
  ApiProvider({String urlServer = 'https://pokeapi.co/api/v2'}) {
    var options = BaseOptions(
        baseUrl: urlServer,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'});
    api = Dio(options);
  }
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return api.get(url, queryParameters: queryParameters, options: options);
  }

  Future<Response> post(
    String url, {
    Map<String, dynamic>? data,
    List<Map<String, dynamic>>? arrayData,
    FormData? multiPartData,
    Options? options,
  }) {
    return api.post(url,
        data: data ?? multiPartData ?? arrayData, options: options);
  }

  Future<Response> put(String url,
      {Map<String, dynamic>? data, Options? options}) {
    return api.put(url, data: data, options: options);
  }

  Future<Response> delete(String url,
      {Map<String, dynamic>? data, Options? options}) {
    return api.delete(url, data: data, options: options);
  }

  Future<Response> patch(String url,
      {Map<String, dynamic>? data, Options? options}) {
    return api.patch(url, data: data, options: options);
  }
}
