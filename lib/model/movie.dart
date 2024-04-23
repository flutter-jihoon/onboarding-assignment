import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
class Movie with _$Movie {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  const factory Movie({
    required final String backdropPath,
    required final String originalTitle,
    required final String overview,
    required final String posterPath,
    required final String title,
    required final double voteAverage,
  }) = _Movie;
  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
