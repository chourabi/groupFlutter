import 'package:http/http.dart' as http;

class Api {
  Future<http.Response> getMoviesList() {
    return http.get(Uri.parse('https://yts.mx/api/v2/list_movies.json'));
  }
}
