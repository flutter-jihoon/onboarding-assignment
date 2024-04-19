import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboarding_assignment/models/film_genre.dart';
import 'package:onboarding_assignment/models/film_poster.dart';
import 'package:onboarding_assignment/models/film.dart';

class MovieService {
  final _token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2NzJjYjNkMDZlMGM5OWIzZDk1ZTczMzlmYjMzYWNlMSIsInN1YiI6IjY2MWUxY2EyM2M0MzQ0MDE3YzAyYjI1YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.JFiC1Wj06PJix4z45ylDe-KIXt4kJG1ejJlqa6DemXg';
  final _dio = Dio();

  Future<List<Film>> getPlayingFilms() async {
    final response = await _dio.get(
      'https://api.themoviedb.org/3/movie/now_playing?language=ko-KR&page=1&region=KR',
      options: Options(
        headers: {
          'Authorization': 'Bearer $_token',
          'Accept': 'application/json',
        },
      ),
    );
    if (response.statusCode == 200) {
      List<dynamic> fromData = response.data['results'] as List<dynamic>;
      List<Film> data = fromData
          .map((e) => Film.fromJson(e as Map<String, dynamic>))
          .toList();
      return data;
    }
    return [];
  }

  Future<List<FilmGenre>> getFilmGenres() async {
    final response = await _dio.get(
      'https://api.themoviedb.org/3/genre/movie/list?language=ko',
      options: Options(
        headers: {
          'Authorization': 'Bearer $_token',
          'Accept': 'application/json',
        },
      ),
    );
    if (response.statusCode == 200) {
      List<dynamic> fromData = response.data['genres'] as List<dynamic>;
      List<FilmGenre> data = fromData
          .map((e) => FilmGenre.fromJson(e as Map<String, dynamic>))
          .toList();
      return data;
    }
    return [];
  }

  Future<List<FilmPoster>> getGenreFilms() async {
    final response = await _dio.get(
      'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=ko-KR&page=1&region=KR&sort_by=popularity.desc&with_genres=',
      options: Options(
        headers: {
          'Authorization': 'Bearer $_token',
          'Accept': 'application/json',
        },
      ),
    );
    if (response.statusCode == 200) {
      List<dynamic> fromData = response.data['genres'] as List<dynamic>;
      List<FilmPoster> data = fromData
          .map((e) => FilmPoster.fromJson(e as Map<String, dynamic>))
          .toList();
      return data;
    }
    return [];
  }
}

final movieServiceProvider = Provider<MovieService>((ref) => MovieService());
