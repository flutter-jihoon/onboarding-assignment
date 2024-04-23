import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboarding_assignment/data/source/http_request.dart';

final clientInstanceProvider = Provider<Dio>((ref) {
  return Dio();
});

final httpRequestProvider = Provider<HttpRequest>((ref) {
  return DioRequest(ref.watch(clientInstanceProvider));
});
