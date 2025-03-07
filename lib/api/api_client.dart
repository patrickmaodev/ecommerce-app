import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:ecommerce_app/utils/api_endpoints.dart';

class ApiClient {
  static final String appBaseUrl = ApiEndpoints.baseUrl;

  final Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };

  Future<dynamic> getData(String endpoint) async {
    try {
      final response = await http.get(Uri.parse(endpoint), headers: headers);
      return _handleResponse(response);
    } catch (e) {
      throw Exception("Failed to connect to server: $e");
    }
  }

  Future<dynamic> postData(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await http.post(
        Uri.parse(endpoint),
        headers: headers,
        body: jsonEncode(data),
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception("Failed to connect to server: $e");
    }
  }

  Future<dynamic> putData(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await http.put(
        Uri.parse(endpoint),
        headers: headers,
        body: jsonEncode(data),
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception("Failed to connect to server: $e");
    }
  }

  Future<dynamic> deleteData(String endpoint) async {
    try {
      final response = await http.delete(Uri.parse(endpoint), headers: headers);
      return _handleResponse(response);
    } catch (e) {
      throw Exception("Failed to connect to server: $e");
    }
  }

  Future<http.Response> postMultipartData(
      String uri, Map<String, String> body, List<MultipartBody> multipartBody,
      {Map<String, String>? headers, bool handleError = true}) async {
    try {
      http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse(appBaseUrl + uri));
      request.headers.addAll(headers ?? this.headers);

      for (MultipartBody multipart in multipartBody) {
        if (multipart.file != null) {
          Uint8List list = await multipart.file!.readAsBytes();
          request.files.add(http.MultipartFile(
            multipart.key, list.asStream(), list.length,
            filename: '${DateTime.now().toString()}.png',
          ));
        }
      }

      request.fields.addAll(body);
      http.Response response = await http.Response.fromStream(await request.send());
      return _handleResponse(response);
    } catch (e) {
      return http.Response(jsonEncode({"status": 1, "message": "No internet connection"}), 500);
    }
  }

  dynamic _handleResponse(http.Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Error: ${response.statusCode}, ${response.body}");
    }
  }
}

extension on Uint8List {
  Stream<List<int>> asStream() {
    return Stream.value(this);
  }
}


class MultipartBody {
  final String key;
  final dynamic file;
  MultipartBody({required this.key, required this.file});
}
