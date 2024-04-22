import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboarding_assignment/providers/provider.dart';
import 'package:onboarding_assignment/widgets/genre_movie_list.dart';
import 'package:onboarding_assignment/widgets/current_movie_card.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MaterialApp(
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
  late final PageController _currentMoviesPageViewController;

  @override
  void initState() {
    super.initState();
    _currentMoviesPageViewController =
        PageController(initialPage: ref.read(pageIndexProvider));
  }

  @override
  Widget build(BuildContext context) {
    // 현재 상영 중인 영화 리스트 Provider
    final AsyncValue currentMovies = ref.watch(currentMoviesProvider);

    // 영화 장르 리스트 Provider
    final AsyncValue movieGenres = ref.watch(movieGenresProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 480,
              child: currentMovies.when(
                data: (movies) {
                  return PageView.builder(
                    controller: _currentMoviesPageViewController,
                    // 페이지가 변경될 때마다 상태를 업데이트합니다.
                    onPageChanged: (index) {
                      ref.read(pageIndexProvider.notifier).state = index;
                    },
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      return CurrentMovieCard(
                        backdropPath: movies[index].backdropPath,
                        voteAverage: movies[index].voteAverage,
                        title: movies[index].title,
                        originalTitle: movies[index].originalTitle,
                        overview: movies[index].overview,
                      );
                    },
                  );
                },
                // TODO: 에러 시 더 친절한 설명
                error: (err, stack) => Text(err.toString()),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            movieGenres.when(
              data: (genres) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: genres.length,
                  itemBuilder: (context, index) {
                    return GenreMovieList(genre: genres[index]);
                  },
                );
              },
              error: (err, stack) => Text(err.toString()),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[850],
        selectedItemColor: Colors.tealAccent,
        unselectedItemColor: Colors.grey[400],
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '검색',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_filter),
            label: '공개 예정',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_sharp),
            label: '마이 노트',
          ),
        ],
      ),
    );
  }
}
