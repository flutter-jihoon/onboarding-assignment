import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboarding_assignment/models/film_genre.dart';
import 'package:onboarding_assignment/models/film.dart';
import 'package:onboarding_assignment/services/movie_service.dart';
import 'package:onboarding_assignment/widgets/genre_film_list.dart';
import 'package:onboarding_assignment/widgets/playing_film_card.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

final playingFilmProvider = FutureProvider<List<Film>>((ref) async {
  final MovieService movieService = MovieService();
  return movieService.getPlayingFilms();
});

final filmGenreProvider = FutureProvider<List<FilmGenre>>((ref) async {
  final MovieService movieService = MovieService();
  return movieService.getFilmGenres();
});

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue playingFilm = ref.watch(playingFilmProvider);
    final AsyncValue filmGenre = ref.watch(filmGenreProvider);

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          padding: const EdgeInsets.only(top: 0),
          shrinkWrap: true,
          children: [
            SizedBox(
              height: 500,
              child: playingFilm.when(
                data: (data) {
                  return PageView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return PlayingFilmCard(
                        backdropPath: data[index].backdropPath,
                        voteAverage: data[index].voteAverage,
                        title: data[index].title,
                        originalTitle: data[index].originalTitle,
                        overview: data[index].overview,
                      );
                    },
                  );
                },
                error: (err, stack) => Text(err.toString()),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            filmGenre.when(
              data: (data) {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return GenreFilmList(
                        id: data[index].id,
                        name: data[index].name,
                      );
                    });
              },
              error: (err, stack) => Text(err.toString()),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
