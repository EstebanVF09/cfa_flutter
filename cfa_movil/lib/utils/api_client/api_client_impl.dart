import 'package:cfa_movil/utils/api_client/api_client.dart';
import 'package:cfa_movil/utils/api_client/api_response.dart';
import 'package:http/http.dart' as http;

class ApiClientImpl implements ApiClient {
  final http.Client clientHttp = http.Client();

  ApiClientImpl();

  @override
  Future<ApiResponse> get(String url) async {
    final uri = Uri.parse(url);
    final response = await clientHttp.get(uri);
    return ApiResponse(data: response.body, status: response.statusCode);
  }

  @override
  Future<ApiResponse> post(String url, String json) async {
    final uri = Uri.parse(url);

    final response = await clientHttp.post(uri);

    return ApiResponse(data: response.body, status: response.statusCode);
  }
}
