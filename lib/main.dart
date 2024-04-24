import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboarding_assignment/model/movie.dart';
import 'package:onboarding_assignment/provider/state/genre_provider.dart';
import 'package:onboarding_assignment/provider/state/playing_movie_provider.dart';
import 'package:onboarding_assignment/widget/genre_movie_list.dart';
import 'package:onboarding_assignment/widget/current_movie_card.dart';
import 'package:onboarding_assignment/widget/main_navigation_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 추가
  await FlutterConfig.loadEnvVariables();
  runApp(
    const ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});
  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_updatePage);
    ref.read(genreProvider.notifier).fetchMovieGenres();
    ref.read(playingMovieProvider.notifier).fetchPlayingMovies();
  }

  @override
  void dispose() {
    _controller.removeListener(_updatePage);
    _controller.dispose();
    super.dispose();
  }

  void _updatePage() {
    setState(() {
      _currentPage = _controller.page!.round();
    });
  }

  Widget _buildPageIndicator(int numOfPages) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List<Widget>.generate(
          numOfPages,
          (int index) => Padding(
            padding: const EdgeInsets.all(1),
            child: Text(
              _currentPage == index ? '•' : '-',
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final playingMovies = ref.watch(playingMovieProvider);
    final movieGenres = ref.watch(genreProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 480,
              child: PageView.builder(
                controller: _controller,
                itemCount: playingMovies.length,
                itemBuilder: (context, index) {
                  final Movie playingMovie = playingMovies[index];
                  return CurrentMovieCard(
                    backdropPath: playingMovie.backdropPath,
                    voteAverage: playingMovie.voteAverage,
                    title: playingMovie.title,
                    originalTitle: playingMovie.originalTitle,
                    overview: playingMovie.overview,
                  );
                },
              ),
            ),
            _buildPageIndicator(playingMovies.length),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: movieGenres.length,
              itemBuilder: (context, index) {
                return GenreMovieList(genre: movieGenres[index]);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const MainNavigationBar(),
    );
  }
}
