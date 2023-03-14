import 'package:get/get.dart';
import 'package:getx_movie_app/pages/modules/moviedetails/movie_detail_controller.dart';

class MovieDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MovieDetailController());
  }
}

///  Use Bindings to initialize controller, APIs,