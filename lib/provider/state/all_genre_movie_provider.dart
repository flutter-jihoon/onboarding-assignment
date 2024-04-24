import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboarding_assignment/model/movie_poster.dart';
import 'package:onboarding_assignment/provider/repository/movie_repository_provider.dart';

final allGenreMovieProvider = StateNotifierProvider.family<
    AllGenreMovieNotifier, AllGenreMovieState, int>((ref, genreId) {
  return AllGenreMovieNotifier(ref, genreId);
});

class AllGenreMovieState {
  final List<MoviePoster> movies;
  final int genreId;
  final int page;

  AllGenreMovieState({
    required this.movies,
    required this.genreId,
    required this.page,
  });

  AllGenreMovieState copyWith(
      {List<MoviePoster>? movies, int? page, int? genreId}) {
    return AllGenreMovieState(
      movies: movies ?? this.movies,
      page: page ?? this.page,
      genreId: genreId ?? this.genreId,
    );
  }
}

class AllGenreMovieNotifier extends StateNotifier<AllGenreMovieState> {
  final Ref ref;
  final int genreId;

  AllGenreMovieNotifier(this.ref, this.genreId)
      : super(AllGenreMovieState(movies: [], genreId: genreId, page: 1));

  Future<void> fetchAllGenreMovies() async {
    print('호출됨, page: ${state.page}');
    List<MoviePoster> moreMovies =
        await ref.read(movieRepositoryProvider).getGenreMovies(
              genreId: genreId,
              page: state.page,
            );
    state = state.copyWith(
        movies: [...state.movies, ...moreMovies], page: state.page + 1);
  }
}
