import 'package:http/http.dart' as http;

class QuotesService {
  bool isLoading = false;

  Future<http.Response> getQuote() async {
    return http.get(Uri.parse('https://api.quotable.io/random'));
  }
}
