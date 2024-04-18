import 'package:flutter/material.dart';
import 'package:onboarding_assignment/models/playing_film_model.dart';
import 'package:onboarding_assignment/services/movie_service.dart';
import 'package:onboarding_assignment/widgets/genre_film_list.dart';
import 'package:onboarding_assignment/widgets/playing_film_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(),
          bodyMedium: TextStyle(),
        ).apply(
          bodyColor: Colors.black,
          displayColor: Colors.white,
        ),
      ),
      title: 'Flutter On-boarding Assignment',
      home: const MyHomePage(title: 'Flutter On-boarding Assignment'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final MovieService _movieService = MovieService();

  @override
  Widget build(BuildContext context) {
    Future<List<PlayingFilmModel>> playingFilms =
        _movieService.getPlayingFilms();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: 500,
            child: FutureBuilder(
              future: playingFilms,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<PlayingFilmModel> data = snapshot.data!;
                  return PageView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, i) {
                        return PlayingFilmCard(
                          backdropPath: data[i].backdropPath,
                          voteAverage: data[i].voteAverage,
                          title: data[i].title,
                          originalTitle: data[i].originalTitle,
                          overview: data[i].overview,
                        );
                      });
                }
                return const Text(
                  "Loading",
                  style: TextStyle(color: Colors.white),
                );
              },
            ),
          ),
          const GenreFilmList(id: 1, name: 'asdf'),
        ],
      ),
    );
  }
}
