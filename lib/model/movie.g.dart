// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieImpl _$$MovieImplFromJson(Map<String, dynamic> json) => _$MovieImpl(
      backdropPath: json['backdrop_path'] as String,
      originalTitle: json['original_title'] as String,
      overview: json['overview'] as String,
      posterPath: json['poster_path'] as String,
      title: json['title'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
    );

Map<String, dynamic> _$$MovieImplToJson(_$MovieImpl instance) =>
    <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'title': instance.title,
      'vote_average': instance.voteAverage,
    };
