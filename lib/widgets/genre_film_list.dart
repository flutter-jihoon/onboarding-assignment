import 'package:flutter/material.dart';
import 'package:onboarding_assignment/pages/film_list_by_genre.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FilmListByGenre(name: name),
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
