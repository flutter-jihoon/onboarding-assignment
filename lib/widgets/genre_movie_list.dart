import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboarding_assignment/models/film_genre.dart';
import 'package:onboarding_assignment/models/film_poster.dart';
import 'package:onboarding_assignment/pages/film_list_by_genre.dart';
import 'package:onboarding_assignment/providers/provider.dart';
import 'package:onboarding_assignment/widgets/poster.dart';

class GenreMovieList extends ConsumerWidget {
  final FilmGenre genre;

  const GenreMovieList({
    super.key,
    required this.genre,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 300,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  genre.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FilmListByGenre(genre: genre),
                  )),
                  child: const Text(
                    '전체보기 >',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final AsyncValue<List<FilmPoster>> filmPosters =
                    ref.watch(genreMovieProvider(genreId: genre.id, page: 1));
                return filmPosters.when(
                  error: (err, stack) => Text(err.toString()),
                  loading: () => const Text('Loading...'),
                  data: (posters) {
                    if (index >= posters.length) {
                      return null;
                    }
                    final poster = posters[index];
                    return Poster(
                      posterPath: poster.posterPath,
                      title: poster.title,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
