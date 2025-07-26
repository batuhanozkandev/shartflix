import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:shartflix/cache/cache.dart';
import '../server.dart';

class ServerController extends BaseServerController {
  final String _baseUrl = 'https://caseapi.servicelabs.tech';

  //Get Request
  Future<Map<String, dynamic>> get(String endPoint) async {
    var token = ShartflixCache.getValue(key: 'token');
    print('token $token');
    final url = Uri.parse(_baseUrl + endPoint);

    Map<String, String>? headers = {};
    if (token != null && token != '') {
      headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      };
    } else {
      headers = {'Content-Type': 'application/json'};
    }
    final response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      _logTheSuccess(response);
      final data = jsonDecode(response.body);
      return data as Map<String, dynamic>;
    } else {
      _logTheError(response);
      return {};
    }
  }

  //Post Request
  Future<Map<String, dynamic>> post(
    String endPoint, {
    required Map<String, dynamic> data,
  }) async {
    var token = ShartflixCache.getValue(key: 'token');
    print('token $token');
    final url = Uri.parse(_baseUrl + endPoint);

    Map<String, String>? headers = {};
    if (token != null && token != '') {
      headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      };
    } else {
      headers = {'Content-Type': 'application/json'};
    }
    print("Sending 'post' data to server : $data");
    final body = jsonEncode(data);
    final response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    Map<String, dynamic> result = jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      _logTheSuccess(response);
    } else {
      _logTheError(response);
    }
    return result;
  }

  Future<void> postMultipart(
      String endPoint, {
        required Map<String, String> fields,
        required File file,
        required String fileFieldName,
      }) async {
    var token = ShartflixCache.getValue(key: 'token');
    final url = Uri.parse(_baseUrl + endPoint);

    final request = http.MultipartRequest('POST', url);

    if (token != null && token.isNotEmpty) {
      request.headers['Authorization'] = 'Bearer $token';
    }

    request.fields.addAll(fields);

    request.files.add(await http.MultipartFile.fromPath(
      fileFieldName,
      file.path,
      contentType: MediaType('image', 'jpeg'),
    ));

    print("Gönderilen alanlar: ${request.fields}");
    print("Gönderilen dosya: ${file.path}");

    final response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Dosya başarıyla yüklendi.");
    } else {
      print("Yükleme hatası: ${response.statusCode}");
      final error = await response.stream.bytesToString();
      print("Hata detay: $error");
    }
  }


  //Put Request
  Future<Map<String, dynamic>> put(
    String endPoint, {
    required Map<String, dynamic> data,
  }) async {
    var token = ShartflixCache.getValue(key: 'token');
    print('token $token');
    final url = Uri.parse(_baseUrl + endPoint);

    Map<String, String>? headers = {};
    if (token != null && token != '') {
      headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      };
    } else {
      headers = {'Content-Type': 'application/json'};
    }
    print("Sending 'put' data to server : $data");
    final body = jsonEncode(data);
    final response = await http.put(
      url,
      headers: headers,
      body: body,
    );
    Map<String, dynamic> result = jsonDecode(response.body);

    if (response.statusCode == 200) {
      _logTheSuccess(response);
    } else {
      _logTheError(response);
    }
    return result;
  }

  //Delete Request
  Future<Map<String, dynamic>> delete(
    String endPoint,
  ) async {
    var token = ShartflixCache.getValue(key: 'token');
    print('token $token');
    final url = Uri.parse(_baseUrl + endPoint);
    Map<String, String>? headers = {};
    if (token != null && token != '') {
      headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      };
    } else {
      headers = {'Content-Type': 'application/json'};
    }

    final response = await http.delete(
      url,
      headers: headers,
    );
    Map<String, dynamic> result = jsonDecode(response.body);

    if (response.statusCode == 200) {
      _logTheSuccess(response);
    } else {
      _logTheError(response);
    }
    return result;
  }

  void _logTheError(http.Response response) {
    print('------------------------------------------------');
    print('Http Error: ${response.statusCode}\nResponse: ${response.body}');
    print('------------------------------------------------');
    Map<String, dynamic> result = jsonDecode(response.body);
    print('code ${response.statusCode}');
    String errorMessage = '';
    switch(result['response']['message']){
      case 'INVALID_CREDENTIALS':
        errorMessage = 'Email or password is wrong. Please try again.';
      case 'TOKEN_UNAVAILABLE':
        errorMessage = 'Lütfen giriş yapınız.';
      default:
        errorMessage = 'Somethings went wrong';
    }
    Get.showSnackbar(
      GetSnackBar(
        title: 'Error!',
        message: errorMessage,
        backgroundColor: Get.theme.colorScheme.error,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _logTheSuccess(http.Response response) {
    print('------------------------------------------------');
    print('Request Successful: ${response.statusCode}');
    print('Response: ${response.body}');
    print('Request: ${response.request}');
    print('Reason Phrase: ${response.reasonPhrase}');
    print('------------------------------------------------');
  }
}
