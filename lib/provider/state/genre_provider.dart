import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboarding_assignment/model/movie_genre.dart';
import 'package:onboarding_assignment/provider/repository/genre_repository_provider.dart';

class GenreNotifier extends StateNotifier<List<MovieGenre>> {
  Ref ref;

  GenreNotifier(this.ref) : super([]);

  Future<void> fetchMovieGenres() async {
    final genres = await ref.read(genreRepositoryProvider).getMovieGenres();
    state = genres;
  }
}

final genreProvider =
    StateNotifierProvider<GenreNotifier, List<MovieGenre>>((ref) {
  return GenreNotifier(ref);
});
