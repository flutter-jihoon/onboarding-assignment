import 'package:flutter/material.dart';

class Poster extends StatelessWidget {
  final String posterPath;
  final String title;

  const Poster({
    super.key,
    required this.posterPath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            'https://image.tmdb.org/t/p/original$posterPath',
            height: 180,
            fit: BoxFit.fitHeight,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
