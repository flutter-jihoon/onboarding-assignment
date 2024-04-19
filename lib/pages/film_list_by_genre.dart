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
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text(
          name,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black87,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
    );
  }
}
