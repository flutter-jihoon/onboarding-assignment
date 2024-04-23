import 'package:flutter/foundation.dart';

import 'package:onboarding_assignment/data/source/http_request.dart';
import 'package:onboarding_assignment/model/movie_genre.dart';

abstract class GenreRepositoryInterface {
  Future<List<MovieGenre>> getMovieGenres();
}

class GenreRepository implements GenreRepositoryInterface {
  final _tmdbApiToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2NzJjYjNkMDZlMGM5OWIzZDk1ZTczMzlmYjMzYWNlMSIsInN1YiI6IjY2MWUxY2EyM2M0MzQ0MDE3YzAyYjI1YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.JFiC1Wj06PJix4z45ylDe-KIXt4kJG1ejJlqa6DemXg';
  final HttpRequest _genreRequest;

  GenreRepository(this._genreRequest);

  @override
  Future<List<MovieGenre>> getMovieGenres() async {
    try {
      final result = await _genreRequest.get(
        'https://api.themoviedb.org/3/genre/movie/list',
        queryParameters: {
          'language': 'ko-KR',
        },
        headers: {
          'Authorization': 'Bearer $_tmdbApiToken',
          'Accept': 'application/json',
        },
      );
      List<dynamic> data = result['genres'] as List<dynamic>;
      return data
          .map((datum) => MovieGenre.fromJson(datum as Map<String, dynamic>))
          .toList();
    } catch (error) {
      debugPrint('Error: $error');
      return [];
    }
  }
}
