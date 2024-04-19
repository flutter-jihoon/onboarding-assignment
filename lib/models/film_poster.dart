class FilmPoster {
  final String posterPath;
  final String title;

  FilmPoster({
    required this.posterPath,
    required this.title,
  });

  factory FilmPoster.fromJson(Map<String, dynamic> json) {
    return FilmPoster(
      posterPath: json['poster_path'],
      title: json['title'],
    );
  }
}
