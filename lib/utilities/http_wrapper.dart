import 'package:http/http.dart' as http;


import '../models/http_error.dart';

class HttpWrapper {
  Future<String> get(String url, {Map<String, String>? headers}) async {
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw HttpError(statusCode: response.statusCode, response: response.body);
    }
  }

  Future post() async {}
  Future put() async {}
  Future delete() async {}
  Future patch() async {}
}
