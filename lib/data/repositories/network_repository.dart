import 'package:dartz/dartz.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../domain/failure/network_failure.dart';

class NetworkRepository {
  Future<Either<NetworkFailure, dynamic>> getUsers(String url) async {
    try {
      var uri = Uri.parse(url);
      var response = await http.get(uri);
      final failure = _handleStatusCode(response.statusCode);
      if (failure != null) {
        return left(failure);
      }
      return right(jsonDecode(response.body));
    } catch (e) {
      return left(NetworkFailure(error: e.toString()));
    }
  }

  NetworkFailure? _handleStatusCode(int code) {
    if (code == 401) {
      return NetworkFailure(error: 'Unauthorized');
    }
    return null;
  }
}
