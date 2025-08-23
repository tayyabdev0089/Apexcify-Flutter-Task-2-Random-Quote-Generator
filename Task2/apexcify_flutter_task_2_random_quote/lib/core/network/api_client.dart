import 'package:http/http.dart' as http;

class ApiClient {
  static const String baseUrl = 'https://api.quotable.io';

  Future<http.Response> getRandomQuote() async {
    return await http.get(Uri.parse('$baseUrl/random'));
  }
}
