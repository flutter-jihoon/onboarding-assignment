class FilmGenreModel {
  final int id;
  final String name;

  FilmGenreModel({
    required this.id,
    required this.name,
  });

  factory FilmGenreModel.fromJson(Map<String, dynamic> json) {
    return FilmGenreModel(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }
}
