// movie_service.dart
import 'package:http/http.dart' as http;
import 'dart:convert';

class MovieService {
  final String apiKey = 'YOUR_API_KEY_HERE';
  final String baseUrl = 'https://api.themoviedb.org/3';

  Future<List<dynamic>> getTopRatedMovies() async {
    final response = await http.get('$baseUrl/movie/top_rated?api_key=$apiKey');
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['results'];
    } else {
      throw Exception('Failed to load top-rated movies');
    }
  }
}
