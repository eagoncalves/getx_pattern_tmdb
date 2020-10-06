import 'package:get/get.dart';
import 'package:tmdb_get_pattern/app/data/models/movie.dart';
import 'package:tmdb_get_pattern/app/data/resositories/local/local_auth_repository.dart';
import 'package:tmdb_get_pattern/app/data/resositories/remote/movie_repository.dart';
import 'package:tmdb_get_pattern/app/routes/app_routes.dart';

class HomeController extends GetxController {
  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();
  final MovieRepository _movieRepository = Get.find<MovieRepository>();

  setSelectedMovie(Movie movie) {
    Get.toNamed(AppRoutes.DETAIL, arguments: movie);
  }

  List<Movie> _ratedMovies = [];

  List<Movie> get ratedMovies => _ratedMovies;

  Future<void> logOut() async {
    await _localAuthRepository.clearSession();
    Get.offNamedUntil(AppRoutes.LOGIN, (_) => false);
  }

  Future<void> getRatedMovies() async {
    try {
      this._ratedMovies = await _movieRepository.getRatedMovies();
      print('movies::: ${_ratedMovies.length}');
      update(['ratedMovies']);
    } catch (error) {
      print('Rated Movies ${error}');
    }
  }

  @override
  void onReady() {
    super.onReady();
    this.getRatedMovies();
  }
}
