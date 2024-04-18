import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:onboarding_assignment/models/film_genre_model.dart';
import 'package:onboarding_assignment/models/playing_film_model.dart';

class MovieService {
  final _token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2NzJjYjNkMDZlMGM5OWIzZDk1ZTczMzlmYjMzYWNlMSIsInN1YiI6IjY2MWUxY2EyM2M0MzQ0MDE3YzAyYjI1YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.JFiC1Wj06PJix4z45ylDe-KIXt4kJG1ejJlqa6DemXg';
  final _dio = Dio();

  Future<List<PlayingFilmModel>> getPlayingFilms() async {
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
      debugPrint('API 정상 작동');
      List<dynamic> fromData = response.data['results'] as List<dynamic>;
      List<PlayingFilmModel> data = fromData
          .map((e) => PlayingFilmModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return data;
    } else {
      return [];
    }
  }

  Future<List<FilmGenreModel>> getFilmGenres() async {
    final response = await _dio.get(
      'https://api.themoviedb.org/3/genre/movie/list',
      options: Options(
        headers: {
          'Authorization': 'Bearer $_token',
          'Accept': 'application/json',
        },
      ),
    );
    if (response.statusCode == 200) {
      debugPrint('API 정상 작동');
      List<dynamic> fromData = response.data['genres'] as List<dynamic>;
      List<FilmGenreModel> data = fromData
          .map((e) => FilmGenreModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return data;
    } else {
      return [];
    }
  }
}
