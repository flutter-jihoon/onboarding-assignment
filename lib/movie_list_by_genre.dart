import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboarding_assignment/model/movie_genre.dart';

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
  @override
  Widget build(BuildContext context) {
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
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return null;
        },
      ),
    );
  }
}
