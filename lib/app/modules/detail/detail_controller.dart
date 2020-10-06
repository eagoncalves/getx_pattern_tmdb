import 'package:get/get.dart';
import 'package:tmdb_get_pattern/app/data/models/movie.dart';
import 'package:tmdb_get_pattern/app/modules/home/home_controller.dart';

class DetailController extends GetxController {
  final HomeController _homeController = Get.find<HomeController>();

  Movie _movie;
  Movie get movie => _movie;

  @override
  void onInit() {
    super.onInit();
    this._movie = Get.arguments as Movie;
    print(this._movie);
  }

}
