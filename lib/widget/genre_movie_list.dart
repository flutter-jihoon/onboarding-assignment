import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboarding_assignment/model/movie_genre.dart';
import 'package:onboarding_assignment/movie_list_by_genre.dart';
import 'package:onboarding_assignment/provider/state/genre_movie_provider.dart';
import 'package:onboarding_assignment/widget/poster_card.dart';

class GenreMovieList extends ConsumerStatefulWidget {
  final MovieGenre genre;

  const GenreMovieList({
    super.key,
    required this.genre,
  });

  @override
  ConsumerState<GenreMovieList> createState() => _GenreMovieListState();
}

class _GenreMovieListState extends ConsumerState<GenreMovieList> {
  @override
  Widget build(BuildContext context) {
    final genreMovies = ref.watch(genreMovieProvider(widget.genre.id));
    ref.read(genreMovieProvider(widget.genre.id).notifier).fetchGenreMovies();

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
                  widget.genre.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FilmListByGenre(genre: widget.genre),
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
              itemCount: genreMovies.length,
              itemBuilder: (context, index) {
                final genreMovie = genreMovies[index];
                return PosterCard(
                  posterPath: genreMovie.posterPath,
                  title: genreMovie.title,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
