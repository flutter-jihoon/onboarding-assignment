import 'package:flutter/material.dart';
import 'package:onboarding_assignment/models/playing_film_model.dart';
import 'package:onboarding_assignment/services/movie_service.dart';
import 'package:onboarding_assignment/widgets/playing_film_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  final MovieService movieService = MovieService();

  @override
  Widget build(BuildContext context) {
    Future<List<PlayingFilmModel>> playingFilms =
        movieService.getPlayingFilms();
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
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
                    overview: data[i].overview,
                  );
                });
          }
          return const Text("Loading");
        },
      ),
    );
  }
}
