import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboarding_assignment/model/movie_poster.dart';
import 'package:onboarding_assignment/provider/repository/movie_repository_provider.dart';

class GenreMovieNotifier extends StateNotifier<List<MoviePoster>> {
  Ref ref;
  int genreId;

  GenreMovieNotifier(this.ref, this.genreId) : super([]);

  Future<void> fetchGenreMovies() async {
    final movies = await ref
        .read(movieRepositoryProvider)
        .getGenreMovies(genreId: genreId, page: 1);
    print(movies);
    state = movies;
  }
}

final genreMovieProvider =
    StateNotifierProvider.family<GenreMovieNotifier, List<MoviePoster>, int>(
        (ref, genreId) {
  return GenreMovieNotifier(ref, genreId);
});
