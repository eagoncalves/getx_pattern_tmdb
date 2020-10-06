import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tmdb_get_pattern/app/data/models/movie.dart';
import 'package:tmdb_get_pattern/app/utils/constants.dart';

class MovieProvider {
  final Dio _dio = Get.find<Dio>();

  Future<List<Movie>> getRatedMovies() async {
    final Response response = await _dio.get(
      '/movie/top_rated',
      queryParameters: {
        'api_key': Constants.API_KEY,
        'language': 'pt',
      },
    );
    return (response.data['results'] as List).map((movie) => Movie.fromJson(movie)).toList();
  }
}