import 'package:flutter/material.dart';

class FilmListByGenre extends StatelessWidget {
  final String name;

  const FilmListByGenre({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[850],
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            name,
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
        body: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            children: const []));
  }
}
