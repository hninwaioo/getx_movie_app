import 'package:dio/dio.dart';
import 'package:getx_movie_app/model/movie_model.dart';
import 'package:getx_movie_app/model/movie_model_impl.dart';
import 'package:getx_movie_app/network/movie_data_agent.dart';
import 'package:getx_movie_app/network/retrofit_data_agent_impl.dart';
import 'package:getx_movie_app/network/the_movie_api.dart';
import 'package:getx_movie_app/response/vos/movie_vo.dart';
import 'package:get/get.dart';

/// Use GetxController for logic and makes fields observable.
///
class NowPlayingMoviesController extends GetxController {
  // TheMovieApi movieApi = TheMovieApi(Dio dio);
  final movieApi = TheMovieApi(Dio(BaseOptions(contentType: "application/json")));
  List<MovieVO>? nowPlayingMovies = [];
  bool isLoading = true;
  MovieModel mMovieModel = MovieModelImpl();
  MovieDataAgent mDataAgent = RetrofitDataAgentImpl();

  @override
  void onInit() {
    super.onInit();
    nowPlayingMoviesData();
  }

  void nowPlayingMoviesData() async {

    await mMovieModel.getNowPlayingMovies(1).then((movieList) {
        nowPlayingMovies = movieList??[];
        print("mNowPlayingMovieFirst==>${nowPlayingMovies}");
        isLoading = false;
        update();
    }).catchError((error) {
      isLoading = false;
      print("Error=>${error}");
    });


    // Future<List<MovieVO>?> getNowPlayingMovies(int page) {
    //   return mDataAgent.getNowPlayingMovies(page)
    //       .then((movieList) async {
    //     // List<MovieVO>? nowPlayingMovies = movieList?.map((movie) {
    //     //   return movie;
    //     // }).toList();
    //     nowPlayingMovies = movieList??[];
    //     isLoading = false;
    //     return Future.value(movieList);
    //
    //   }).catchError((error){
    //     isLoading = false;
    //     print("Error=>${error}");
    //   });
    // }
  }


}