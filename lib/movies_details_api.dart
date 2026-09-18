import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../data/models/movie_model.dart';

class MovieApiService {
  // Primary API + fallback mirrors used by the working project.
  static const List<String> baseUrls = [
    'https://movies-api.accel.li/api/v2/',
    'https://yts.gg/api/v2/',
    'https://yts.mx/api/v2/',
    'https://yts.lt/api/v2/',
    'https://yts.am/api/v2/',
  ];

  final Dio _dio;

  MovieApiService({Dio? dio})
      : _dio = dio ??
      Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 8),
          receiveTimeout: const Duration(seconds: 8),
          followRedirects: true,
          maxRedirects: 5,
          validateStatus: (status) =>
          status != null && status < 400,
          headers: {
            'Accept': 'application/json',
          },
        ),
      );

    Future<Response?> _getWithMirrors(
      String endpoint, {
        Map<String, dynamic>? queryParameters,
      }) async {
    for (final base in baseUrls) {
      try {
        final url = '$base$endpoint';

        debugPrint(
          '[MovieApiService] Requesting: $url '
              'params: $queryParameters',
        );

        final response = await _dio.get(
          url,
          queryParameters: queryParameters,
        );

        if (response.statusCode == 200 && response.data != null) {
          return response;
        }
      } catch (e) {
        debugPrint(
          '[MovieApiService] $base failed: $e',
        );
      }
    }

    return null;
  }


  Future<List<MovieModel>> getMovies({
    String? queryTerm,
    String? genre,
    int page = 1,
    int limit = 20,
    String? sortBy,
  }) async {
    final Map<String, dynamic> queryParams = {
      'page': page,
      'limit': limit,
    };

    if (queryTerm != null && queryTerm.trim().isNotEmpty) {
      queryParams['query_term'] = queryTerm.trim();
    }

    if (genre != null &&
        genre.trim().isNotEmpty &&
        genre.toLowerCase() != 'all') {
      queryParams['genre'] = genre.trim();
    }

    if (sortBy != null && sortBy.trim().isNotEmpty) {
      queryParams['sort_by'] = sortBy.trim();
    }

    try {
      final response = await _getWithMirrors(
        'list_movies.json',
        queryParameters: queryParams,
      );

      if (response != null && response.data != null) {
        final data = response.data['data'];

        if (data != null && data['movies'] != null) {
          final List moviesJson = data['movies'];

          return moviesJson
              .map((json) => MovieModel.fromJson(json))
              .toList();
        }
      }

      return [];
    } catch (e) {
      debugPrint(
        '[MovieApiService] getMovies error: $e',
      );
      return [];
    }
  }

  Future<MovieModel?> getMovieDetails(int movieId) async {
    try {
      debugPrint(
        '[MovieApiService] Getting details for movie ID: $movieId',
      );

      final response = await _getWithMirrors(
        'movie_details.json',
        queryParameters: {
          'movie_id': movieId,
          'with_images': true,
          'with_cast': true,
        },
      );

      if (response != null && response.data != null) {
        final data = response.data['data'];

        if (data != null && data['movie'] != null) {
          debugPrint(
            '[MovieApiService] Movie details loaded: '
                '${data['movie']['title']}',
          );

          return MovieModel.fromJson(data['movie']);
        }
      }

      return null;
    } catch (e) {
      debugPrint(
        '[MovieApiService] getMovieDetails error for ID '
            '$movieId: $e',
      );
      return null;
    }
  }


  Future<List<MovieModel>> getMovieSuggestions(int movieId) async {
    try {
      debugPrint(
        '[MovieApiService] Getting suggestions for movie ID: $movieId',
      );

      final response = await _getWithMirrors(
        'movie_suggestions.json',
        queryParameters: {
          'movie_id': movieId,
        },
      );

      if (response != null && response.data != null) {
        final data = response.data['data'];

        if (data != null && data['movies'] != null) {
          final List moviesJson = data['movies'];

          debugPrint(
            '[MovieApiService] Suggestions found: '
                '${moviesJson.length}',
          );

          return moviesJson
              .map((json) => MovieModel.fromJson(json))
              .toList();
        }
      }

      return [];
    } catch (e) {
      debugPrint(
        '[MovieApiService] getMovieSuggestions error for ID '
            '$movieId: $e',
      );
      return [];
    }
  }


  Future<List<MovieModel>> searchMovies(String query) async {
    if (query.trim().isEmpty) {
      return [];
    }

    return getMovies(
      queryTerm: query,
      limit: 30,
    );
  }


  Future<List<MovieModel>> getMoviesByGenre(String genre) async {
    return getMovies(
      genre: genre == 'All' ? null : genre,
      limit: 30,
      sortBy: 'rating',
    );
  }


  Future<List<MovieModel>> getHomeMovies() async {
    return getMovies(
      limit: 20,
      sortBy: 'like_count',
    );
  }
}
