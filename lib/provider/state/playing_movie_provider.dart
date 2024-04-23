import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboarding_assignment/model/movie.dart';
import 'package:onboarding_assignment/provider/repository/movie_repository_provider.dart';

class PlayingMovieNotifier extends StateNotifier<List<Movie>> {
  Ref ref;

  PlayingMovieNotifier(this.ref) : super([]);

  Future<void> fetchPlayingMovies() async {
    final movies = await ref.read(movieRepositoryProvider).getPlayingMovies();
    state = movies;
  }
}

final playingMovieProvider =
    StateNotifierProvider<PlayingMovieNotifier, List<Movie>>((ref) {
  return PlayingMovieNotifier(ref);
});
