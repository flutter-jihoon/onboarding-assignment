import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_poster.freezed.dart';
part 'movie_poster.g.dart';

@freezed
class MoviePoster with _$MoviePoster {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  const factory MoviePoster({
    required final String posterPath,
    required final String title,
  }) = _MoviePoster;
  factory MoviePoster.fromJson(Map<String, dynamic> json) =>
      _$MoviePosterFromJson(json);
}
