import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_movie_app/pages/modules/nowplaying/now_playing_movies_binding.dart';
import 'package:getx_movie_app/pages/now_playing_show_movies_page.dart';
import 'package:getx_movie_app/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       initialBinding: UpcomingMovieBinding(),
//       home: const NowPlayingShowMoviesPage(),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Movies',
      theme: ThemeData.dark(),
      home: NowPlayingShowMoviesPage(),
      initialBinding: NowPlayingMoviesBinding(),
      getPages: AppPages.pages,
    );
  }
}

