import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboarding_assignment/providers/provider.dart';
import 'package:onboarding_assignment/widgets/genre_film_list.dart';
import 'package:onboarding_assignment/widgets/playing_film_card.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MaterialApp(
        home: MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue playingFilm = ref.watch(playingFilmProvider);
    final AsyncValue filmGenre = ref.watch(filmGenreProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        padding: const EdgeInsets.only(top: 0),
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 500,
            child: playingFilm.when(
              data: (films) {
                return PageView.builder(
                  itemCount: films.length,
                  itemBuilder: (context, index) {
                    return PlayingFilmCard(
                      backdropPath: films[index].backdropPath,
                      voteAverage: films[index].voteAverage,
                      title: films[index].title,
                      originalTitle: films[index].originalTitle,
                      overview: films[index].overview,
                    );
                  },
                );
              },
              error: (err, stack) => Text(err.toString()),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
          filmGenre.when(
            data: (genre) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: genre.length,
                itemBuilder: (context, index) {
                  return GenreFilmList(
                    id: genre[index].id,
                    name: genre[index].name,
                  );
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
