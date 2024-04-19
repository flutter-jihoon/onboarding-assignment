import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboarding_assignment/models/film.dart';
import 'package:onboarding_assignment/models/film_genre.dart';
import 'package:onboarding_assignment/services/movie_service.dart';

final playingFilmProvider = FutureProvider<List<Film>>((ref) async {
  return ref.watch(movieServiceProvider).getPlayingFilms();
});

final filmGenreProvider = FutureProvider<List<FilmGenre>>((ref) async {
  final MovieService movieService = MovieService();
  return movieService.getFilmGenres();
});
