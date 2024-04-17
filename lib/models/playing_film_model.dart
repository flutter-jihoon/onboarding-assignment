class PlayingFilmModel {
  // 영화 이미지, 평점, 제목, 설명
  final String backdropPath;
  final double voteAverage;
  final String title;
  final String overview;

  PlayingFilmModel({
    required this.backdropPath,
    required this.voteAverage,
    required this.title,
    required this.overview,
  });

  factory PlayingFilmModel.fromJson(Map<String, dynamic> json) {
    return PlayingFilmModel(
      backdropPath: json['backdrop_path'],
      voteAverage: json['vote_average'],
      title: json['title'],
      overview: json['overview'],
    );
  }
}
