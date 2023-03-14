import 'package:get/get.dart';
import 'package:getx_movie_app/pages/modules/nowplaying/now_playing_movies_controller.dart';

class NowPlayingMoviesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NowPlayingMoviesController());
  }
}

///  Use Bindings to initialize controller, APIs,