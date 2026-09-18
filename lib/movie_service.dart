import 'dart:convert';
import 'package:http/http.dart' as http;

import 'movie.dart';

class MovieService {
  static const String baseUrl = 'https://movies-api.accel.li/api/v2/list_movies.json';

  Future<List<Movie>> fetchMovies({
    int limit = 20,
    String? genre,
    String sortBy = 'download_count',
  }) async {
    final uri = Uri.parse(baseUrl).replace(queryParameters: {
      'limit': '$limit',
      'sort_by': sortBy,
      if (genre != null) 'genre': genre,
    });

    final response = await http.get(uri).timeout(const Duration(seconds: 15));

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      final moviesJson = body['data']['movies'] as List<dynamic>?;
      if (moviesJson == null) return [];
      return moviesJson.map((m) => Movie.fromJson(m)).toList();
    } else {
      throw Exception('Error fetching movies (status code: ${response.statusCode})');
    }
  }

  Future<Map<String, List<Movie>>> fetchMoviesByGenres({
    required List<String> genres,
    int limitPerGenre = 8,
  }) async {
    final Map<String, List<Movie>> result = {};

    final futures = genres.map((g) => fetchMovies(
      limit: limitPerGenre,
      genre: g,
    ));

    final results = await Future.wait(futures);

    for (int i = 0; i < genres.length; i++) {
      result[genres[i]] = results[i];
    }
    return result;
  }
}