class FilmGenre {
  final int id;
  final String name;

  FilmGenre({
    required this.id,
    required this.name,
  });

  factory FilmGenre.fromJson(Map<String, dynamic> json) {
    return FilmGenre(
      id: json['id'],
      name: json['name'],
    );
  }
}
