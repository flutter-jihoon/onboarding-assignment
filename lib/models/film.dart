class Film {
  final String backdropPath;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String title;
  final double voteAverage;

  Film({
    required this.backdropPath,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.title,
    required this.voteAverage,
  });

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      backdropPath: json['backdrop_path'] ?? '',
      originalTitle: json['original_title'] ?? '',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'] ?? '',
      title: json['title'] ?? '',
      voteAverage: json['vote_average'] ?? 0,
    );
  }
}
