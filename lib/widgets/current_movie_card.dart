import 'package:flutter/material.dart';

class CurrentMovieCard extends StatelessWidget {
  final String backdropPath;
  final double voteAverage;
  final String title;
  final String originalTitle;
  final String overview;

  const CurrentMovieCard({
    super.key,
    required this.backdropPath,
    required this.voteAverage,
    required this.title,
    required this.originalTitle,
    required this.overview,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          'https://image.tmdb.org/t/p/w500$backdropPath',
          height: 400,
          fit: BoxFit.fitHeight,
        ),
        Container(
          height: 400,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black,
              ],
            ),
          ),
        ),
        Positioned(
          top: 60,
          right: 20,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Text(
              '평점: $voteAverage',
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: 400,
            padding: const EdgeInsets.only(left: 10, right: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                Text(
                  originalTitle,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  overview,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
