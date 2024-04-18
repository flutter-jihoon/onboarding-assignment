class PlayingFilmModel {
  // 영화 이미지, 평점, 제목, 설명
  final String backdropPath;
  final double voteAverage;
  final String title;
  final String originalTitle;
  final String overview;

  PlayingFilmModel({
    required this.backdropPath,
    required this.voteAverage,
    required this.title,
    required this.originalTitle,
    required this.overview,
  });

  factory PlayingFilmModel.fromJson(Map<String, dynamic> json) {
    return PlayingFilmModel(
      backdropPath: json['backdrop_path'],
      voteAverage: json['vote_average'] ?? '평점 없음',
      title: json['title'] ?? '제목 없음',
      originalTitle: json['original_title'] ?? '',
      overview: json['overview'] ?? '',
    );
  }
}
