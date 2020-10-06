import 'package:get/get.dart';
import 'package:tmdb_get_pattern/app/data/models/movie.dart';
import 'package:tmdb_get_pattern/app/data/providers/remote/movie_provider.dart';

class MovieRepository {

  final MovieProvider _movieProvider = Get.find<MovieProvider>();

  Future<List<Movie>> getRatedMovies() => _movieProvider.getRatedMovies();
}