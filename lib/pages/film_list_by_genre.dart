import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboarding_assignment/models/film_genre.dart';
import 'package:onboarding_assignment/models/film_poster.dart';
import 'package:onboarding_assignment/widgets/poster.dart';

class FilmListByGenre extends ConsumerWidget {
  final FilmGenre genre;

  const FilmListByGenre({
    super.key,
    required this.genre,
  });

  static const pageSize = 20;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          genre.name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.grey[850],
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final page = index ~/ pageSize + 1;
          final indexInPage = index % pageSize;
          final AsyncValue<List<FilmPoster>> filmPosters =
              ref.watch(genreMovieProvider(genreId: genre.id, page: page));
          print('${genre.name}, $page');
          return filmPosters.when(
            error: (err, stack) => Text(err.toString()),
            loading: () => const Text('Loading...'),
            data: (posters) {
              if (indexInPage >= posters.length) {
                return null;
              }
              final poster = posters[indexInPage];
              return Poster(
                posterPath: poster.posterPath,
                title: poster.title,
              );
            },
          );
        },
      ),
    );
  }
}
