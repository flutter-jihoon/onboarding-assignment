import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlayingFilmCard extends StatelessWidget {
  final String backdropPath;
  final double voteAverage;
  final String title;
  final String overview;

  const PlayingFilmCard({
    super.key,
    required this.backdropPath,
    required this.voteAverage,
    required this.title,
    required this.overview,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image.network('https://image.tmdb.org/t/p/original$backdropPath'),
      Container(
        color: Colors.pink,
        child: Text(
          '평점:$voteAverage',
        ),
      ),
      Text(
        title,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
      Text(
        overview,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
      ),
    ]);
  }
}
