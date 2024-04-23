import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboarding_assignment/data/repository/genre_repository.dart';
import 'package:onboarding_assignment/provider/repository/request_provider.dart';

final genreRepositoryProvider = Provider<GenreRepositoryInterface>((ref) {
  final genreRequest = ref.watch(httpRequestProvider);
  return GenreRepository(genreRequest);
});
