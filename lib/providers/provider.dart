import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:onboarding_assignment/models/film.dart';
import 'package:onboarding_assignment/models/film_genre.dart';
import 'package:onboarding_assignment/repositories/film_repository.dart';

final currentMoviesProvider = FutureProvider<List<Film>>((ref) async {
  return ref.watch(movieServiceProvider).getPlayingFilms();
});

final movieGenresProvider = FutureProvider<List<FilmGenre>>((ref) async {
  return ref.watch(movieServiceProvider).getFilmGenres();
});

final genreMovieProvider = FutureProvider<List<FilmPoster>>((ref) async {
  final MovieRepository movieRepository = MovieRepository();
  movieRepository.getGenreFilms(genreId: genreId, page: page)
})

final pageIndexProvider = StateProvider<int>((ref) => 0);
