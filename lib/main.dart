import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_get_pattern/app/modules/splash/splash_binding.dart';
import 'package:tmdb_get_pattern/app/modules/splash/splash_page.dart';
import 'package:tmdb_get_pattern/app/routes/app_pages.dart';

import 'app/utils/dependency_injection.dart';

void main() {
  DependencyInjection.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( 
      title: 'TMDB with GetX Pattern',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialBinding: SplashBinding(),
      home: SplashPage(),
      getPages: AppPages.pages,
    );
  }


}
