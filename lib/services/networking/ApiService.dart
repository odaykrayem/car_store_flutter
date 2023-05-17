import 'package:car_store_flutter/services/networking/BaseProvider.dart';
import 'package:car_store_flutter/shared/typedef.dart';
import 'package:flutter/material.dart';

import 'api_client.dart';

class ApiService {
  final BaseProvider _baseProvider;

  ApiService(this._baseProvider);

  Future<JSON> get<T>({
    required String endpoint,
    JSON? query,
    Map<String, String>? headers,
    bool requiresAuthToken = false,
  }) async {
    var customHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Accept-Encoding': 'application/json',
    };

    if (headers != null) {
      customHeaders.addAll(headers);
    }

    final response =
        await _baseProvider.get(endpoint, headers: customHeaders, query: query);
    debugPrint('responseB${response.body}');
    debugPrint('responseSC${response.statusCode}');
    debugPrint('responseST${response.statusText}');
    debugPrint('responseS${response.status}');
    debugPrint('responseBB${response.bodyBytes}');
    debugPrint('responseBS${response.bodyString}');
    debugPrint('response${response.toString()}');
    return response.body;
  }

  Future<JSON> post<T>({
    required String endpoint,
    JSON? body,
    JSON? query,
    Map<String, String>? headers,
    bool requiresAuthToken = false,
  }) async {
    var customHeaders = {
      'Accept': 'application/json',
      requiresAuthToken ? 'Authorization' : '': '',
    };

    if (headers != null) {
      customHeaders.addAll(headers);
    }

    final response = await _baseProvider.post(endpoint, body,
        headers: customHeaders, query: query);

    return response.body;
  }

  Future<JSON> put<T>({
    required String endpoint,
    JSON? body,
    JSON? query,
    Map<String, String>? headers,
    bool requiresAuthToken = false,
  }) async {
    var customHeaders = {
      'Accept': 'application/json',
      requiresAuthToken ? 'Authorization' : '': '',
    };

    if (headers != null) {
      customHeaders.addAll(headers);
    }

    final response = await _baseProvider.put(endpoint, body,
        headers: customHeaders, query: query);

    return response.body;
  }

  Future<JSON> delete<T>({
    required String endpoint,
    JSON? body,
    JSON? query,
    Map<String, String>? headers,
    bool requiresAuthToken = false,
  }) async {
    var customHeaders = {
      'Accept': 'application/json',
      requiresAuthToken ? 'Authorization' : '': '',
    };

    if (headers != null) {
      customHeaders.addAll(headers);
    }

    final response = await _baseProvider.delete(endpoint,
        headers: customHeaders, query: query);

    return response.body;
  }
}
