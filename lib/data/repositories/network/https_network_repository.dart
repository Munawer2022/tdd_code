import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:test123/domain/repositories/network/network_base_api_service.dart';

import '/domain/failure/network_failure.dart';
import 'package:http/http.dart' as http;
import 'package:test123/data/datasources/login/login_data_sources.dart';

class HttpsNetworkRepository implements NetworkBaseApiService {
  final LoginDataSources _loginDataSources;
  HttpsNetworkRepository(this._loginDataSources);
  @override
  Future<Either<NetworkFailure, T>> get<T>({required String url}) async {
    try {
      var uri = Uri.parse(url);
      var response = await http.get(uri, headers: {
        // 'Authorization': 'Bearer $token'
        'Authorization': 'Bearer ${_loginDataSources.state.token}'
      }).timeout(const Duration(seconds: 10));
      final failure = _handleStatusCode(response);
      if (failure != null) {
        return left(failure);
      }
      return right(jsonDecode(response.body));
    } on TimeoutException {
      return left(NetworkFailure(
          error: 'Please check your internet connection and try again.'));
    } on SocketException {
      return left(NetworkFailure(error: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<NetworkFailure, T>> post<T>(
      {required String url,
      required Map<String, dynamic> body,
      Map<String, String>? headers}) async {
    try {
      var uri = Uri.parse(url);
      var response = await http
          .post(uri, body: body, headers: headers)
          .timeout(const Duration(seconds: 10));
      final failure = _handleStatusCode(response);
      if (failure != null) {
        return left(failure);
      }
      return right(jsonDecode(response.body));
    } on TimeoutException {
      return left(NetworkFailure(
          error: 'Please check your internet connection and try again.'));
    } on SocketException {
      return left(NetworkFailure(error: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<NetworkFailure, T>> patch<T>(
      {required String url,
      required Map<String, dynamic> body,
      Map<String, String>? headers}) async {
    try {
      var uri = Uri.parse(url);
      var response = await http
          .patch(uri,
              body: body,
              headers: headers ??
                  {'Authorization': 'Bearer ${_loginDataSources.state.token}'})
          .timeout(const Duration(seconds: 10));
      final failure = _handleStatusCode(response);
      if (failure != null) {
        return left(failure);
      }
      return right(jsonDecode(response.body));
    } on TimeoutException {
      return left(NetworkFailure(
          error: 'Please check your internet connection and try again.'));
    } on SocketException {
      return left(NetworkFailure(error: 'No Internet Connection'));
    }
  }

  NetworkFailure? _handleStatusCode(http.Response code) {
    if (code.statusCode == 400 ||
        code.statusCode == 401 ||
        code.statusCode == 403 ||
        code.statusCode == 404 ||
        code.statusCode == 500) {
      final Map<String, dynamic> response = jsonDecode(code.body);
      return NetworkFailure(error: response['message'] ?? "Error");
    }
    return null;
  }
}
