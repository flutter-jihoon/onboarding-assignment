import 'package:flutter/foundation.dart';

import 'package:onboarding_assignment/data/source/http_request.dart';
import 'package:onboarding_assignment/model/movie.dart';
import 'package:onboarding_assignment/model/movie_poster.dart';

abstract class MovieRepositoryInterface {
  Future<List<Movie>> getPlayingMovies();
  Future<List<MoviePoster>> getGenreMovies(
      {required int genreId, required int page});
}

class MovieRepository implements MovieRepositoryInterface {
  final _tmdbApiToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2NzJjYjNkMDZlMGM5OWIzZDk1ZTczMzlmYjMzYWNlMSIsInN1YiI6IjY2MWUxY2EyM2M0MzQ0MDE3YzAyYjI1YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.JFiC1Wj06PJix4z45ylDe-KIXt4kJG1ejJlqa6DemXg';
  final HttpRequest _movieRequest;

  MovieRepository(this._movieRequest);

  @override
  Future<List<Movie>> getPlayingMovies() async {
    try {
      final result = await _movieRequest.get(
        'https://api.themoviedb.org/3/movie/now_playing',
        queryParameters: {
          'language': 'ko-KR',
          'page': '1',
          'region': 'KR',
        },
        headers: {
          'Authorization': 'Bearer $_tmdbApiToken ',
          'Accept': 'application/json',
        },
      );
      List<dynamic> data = result['results'] as List<dynamic>;
      return data
          .map((datum) => Movie.fromJson(datum as Map<String, dynamic>))
          .toList();
    } catch (error) {
      debugPrint('Error: $error');
      return [];
    }
  }

  @override
  Future<List<MoviePoster>> getGenreMovies({
    required int genreId,
    required int page,
  }) async {
    try {
      final result = await _movieRequest.get(
        'https://api.themoviedb.org/3/discover/movie',
        queryParameters: {
          'include_adult': 'false',
          'include_video': 'false',
          'language': 'ko-KR',
          'page': '$page',
          'region': 'KR',
          'sort_by': 'popularity.desc',
          'with_genres': '$genreId',
        },
        headers: {
          'Authorization': 'Bearer $_tmdbApiToken ',
          'Accept': 'application/json',
        },
      );
      List<dynamic> data = result['results'] as List<dynamic>;
      return data
          .map((datum) => MoviePoster.fromJson(datum as Map<String, dynamic>))
          .toList();
    } catch (error) {
      debugPrint('Error: $error');
      return [];
    }
  }
}
