import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tmdb_get_pattern/app/data/models/movie.dart';
import 'package:tmdb_get_pattern/app/data/resositories/remote/movie_repository.dart';
import 'package:tmdb_get_pattern/app/modules/home/home_controller.dart';
import 'package:tmdb_get_pattern/app/utils/constants.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;

  const MovieItem({Key key, @required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController _homeController = Get.find<HomeController>();
    return ListTile(
      leading: Image.network('${Constants.IMAGE_PATH}${movie.posterPath}'),
      title: Text(movie.title),
      subtitle: Container(
        padding: EdgeInsets.only(right: 12),
        height: 80,
        child: Text(
          movie.overview,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          softWrap: true,
        ),
      ),
      onTap: () => _homeController.setSelectedMovie(movie),
    );
  }
}
