import 'package:get/get.dart';
import 'package:getx_movie_app/pages/modules/moviedetails/movie_detail_binding.dart';
import 'package:getx_movie_app/pages/modules/nowplaying/now_playing_movies_binding.dart';
import 'package:getx_movie_app/pages/movie_detail_view_page.dart';
import 'package:getx_movie_app/pages/now_playing_show_movies_page.dart';
import 'package:getx_movie_app/routes/app_routes.dart';


/// require routes to navigate for one screen to another screen using GetPage in GetX
class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.nowPlayingMovie,
      page: () => NowPlayingShowMoviesPage(),
      binding: NowPlayingMoviesBinding(),
    ),
    GetPage(
      name: AppRoutes.movieDetails,
      page: () => MovieDetailViewPage(),
      binding: MovieDetailBinding(),
    ),
  ];
}