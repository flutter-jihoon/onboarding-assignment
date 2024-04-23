import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboarding_assignment/data/repository/movie_repository.dart';
import 'package:onboarding_assignment/provider/repository/request_provider.dart';

final movieRepositoryProvider = Provider<MovieRepositoryInterface>((ref) {
  final movieRequest = ref.watch(httpRequestProvider);
  return MovieRepository(movieRequest);
});
