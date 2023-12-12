import 'package:get/get_connect.dart';

import 'base_service.dart';

class AuthProvider extends BaseService {
  Future<Response> login(String url, Map<String, dynamic> param) async {
    final requestHeaders = {
      'Content-Type': 'application/json',
    };

    return get(
      url,
      headers: requestHeaders,
    );
  }

  Future<Response> getProfile(String url) async {
    final requestHeaders = {
      'Content-Type': 'application/json',
    };

    return get(
      '$url',
      headers: requestHeaders,
    );
  }
}