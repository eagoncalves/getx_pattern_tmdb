import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_get_pattern/app/data/models/movie.dart';
import 'package:tmdb_get_pattern/app/modules/home/home_controller.dart';
import 'package:tmdb_get_pattern/app/modules/home/local_widgets/movie_item.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('HomePage'),
          actions: [
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                _.logOut();
              },
            )
          ],
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: ListView.builder(
              itemCount: _.ratedMovies.length,
              itemBuilder: (context, index) {
                Movie _movie = _.ratedMovies[index];
                return MovieItem(movie: _movie);
              }),
        ),
      ),
    );
  }
}
