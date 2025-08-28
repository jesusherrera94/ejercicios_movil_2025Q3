import 'package:http/http.dart' as http;

class HttpAdapter {
  Future<dynamic> getRequest(String domain, String path) async {
    Uri uri = Uri.https(domain, path);
    http.Response response = await http.get(uri);
    return response.body;
  }
}
