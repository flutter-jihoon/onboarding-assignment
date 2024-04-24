import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboarding_assignment/model/movie_genre.dart';
import 'package:onboarding_assignment/provider/state/all_genre_movie_provider.dart';
import 'package:onboarding_assignment/widget/poster_card.dart';

class FilmListByGenre extends ConsumerStatefulWidget {
  final MovieGenre genre;

  const FilmListByGenre({
    super.key,
    required this.genre,
  });

  @override
  ConsumerState<FilmListByGenre> createState() => _FilmListByGenreState();
}

class _FilmListByGenreState extends ConsumerState<FilmListByGenre> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    ref
        .read(allGenreMovieProvider(widget.genre.id).notifier)
        .fetchAllGenreMovies();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      ref
          .read(allGenreMovieProvider(widget.genre.id).notifier)
          .fetchAllGenreMovies();
    }
  }

  @override
  Widget build(BuildContext context) {
    final movies = ref.watch(allGenreMovieProvider(widget.genre.id)).movies;
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          widget.genre.name,
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
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisExtent: 280,
        ),
        controller: _scrollController,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return PosterCard(posterPath: movie.posterPath, title: movie.title);
        },
      ),
    );
  }
}
