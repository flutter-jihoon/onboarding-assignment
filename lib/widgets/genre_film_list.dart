import 'package:flutter/material.dart';
import 'package:onboarding_assignment/widgets/poster.dart';

class GenreFilmList extends StatelessWidget {
  final int id;
  final String name;

  const GenreFilmList({
    super.key,
    required this.id,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          SizedBox(
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                GestureDetector(
                  child: const Text(
                    '전체보기 >',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 250,
            child: ListView(scrollDirection: Axis.horizontal, children: const [
              Poster(
                  posterPath:
                      'https://static.remove.bg/sample-gallery/graphics/bird-thumbnail.jpg',
                  title: 'asdf'),
              Poster(
                  posterPath:
                      'https://static.remove.bg/sample-gallery/graphics/bird-thumbnail.jpg',
                  title: 'ghjk'),
              Poster(
                  posterPath:
                      'https://static.remove.bg/sample-gallery/graphics/bird-thumbnail.jpg',
                  title: 'ghjk'),
              Poster(
                  posterPath:
                      'https://static.remove.bg/sample-gallery/graphics/bird-thumbnail.jpg',
                  title: 'ghjk'),
              Poster(
                  posterPath:
                      'https://static.remove.bg/sample-gallery/graphics/bird-thumbnail.jpg',
                  title: 'ghjk'),
              Poster(
                  posterPath:
                      'https://static.remove.bg/sample-gallery/graphics/bird-thumbnail.jpg',
                  title: 'ghjk'),
              Poster(
                  posterPath:
                      'https://static.remove.bg/sample-gallery/graphics/bird-thumbnail.jpg',
                  title: 'ghjk'),
              Poster(
                  posterPath:
                      'https://static.remove.bg/sample-gallery/graphics/bird-thumbnail.jpg',
                  title: 'ghjk'),
              Poster(
                  posterPath:
                      'https://static.remove.bg/sample-gallery/graphics/bird-thumbnail.jpg',
                  title: 'ghjk'),
              Poster(
                  posterPath:
                      'https://static.remove.bg/sample-gallery/graphics/bird-thumbnail.jpg',
                  title: 'ghjk'),
            ]),
          ),
        ],
      ),
    );
  }
}
