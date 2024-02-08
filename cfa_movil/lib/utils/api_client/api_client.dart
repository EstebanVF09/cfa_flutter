import 'package:cfa_movil/utils/api_client/api_response.dart';

abstract class ApiClient {
  Future<ApiResponse> get(String url);
  Future<ApiResponse> post(String url, String json);
}
