import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:getx_movie_app/model/movie_model.dart';
import 'package:getx_movie_app/model/movie_model_impl.dart';
import 'package:getx_movie_app/network/movie_data_agent.dart';
import 'package:getx_movie_app/network/retrofit_data_agent_impl.dart';
import 'package:getx_movie_app/network/the_movie_api.dart';
import 'package:getx_movie_app/response/vos/movie_vo.dart';

/// Use GetxController for logic and makes fields observable.
class MovieDetailController extends GetxController {
  int movieId = Get.arguments[0];
  final movieApi = TheMovieApi(Dio(BaseOptions(contentType: "application/json")));
  // MovieVO? mMoviesDetail;
  List<MovieVO> mMoviesDetail = [];
  MovieModel mMovieModel = MovieModelImpl();
  MovieDataAgent mDataAgent = RetrofitDataAgentImpl();

  @override
  void onInit() {
    super.onInit();
    movieDetailData();
  }

  void movieDetailData() async {

     await mMovieModel.getMovieDetail(movieId)?.then((movieData) {
       // mMoviesDetail.add(movieData);

      if(movieData!=null) {
        mMoviesDetail.add(movieData);
        print("MovieDetailData==>${mMoviesDetail}");
        print("object=>${movieId}");
        update();
      }else{
        print("MovieDetailData==>IsEmpty");

      }

    }).catchError((error) {
      print("Error=>${error}");
    });
  }


  // updateMovieID(int movieID) {
  //   movieId = movieID;
  //   print('im print ${movieId}');
  //   movieDetailData(movieID);
  // }
}
