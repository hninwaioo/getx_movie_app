import 'package:dio/dio.dart';
import 'package:getx_movie_app/network/the_movie_api.dart';
import 'package:getx_movie_app/response/vos/movie_vo.dart';
import 'api_constants.dart';
import 'movie_data_agent.dart';

class RetrofitDataAgentImpl extends MovieDataAgent{
  late TheMovieApi mApi;

  static final RetrofitDataAgentImpl _singleton = RetrofitDataAgentImpl._internal();

  factory RetrofitDataAgentImpl(){
    return _singleton;
  }


  RetrofitDataAgentImpl._internal(){
    final dio = Dio();
    mApi = TheMovieApi(dio);

  }

  @override
  Future<List<MovieVO>?> getNowPlayingMovies(int page) {
    return mApi.getNowPlayingMovies(API_KEY, LANGUAGE_EN_US, page.toString())
        .asStream()
        .map((response) => response.results)
        .first;
  }

  @override
  Future<MovieVO>? getMovieDetail(int movieId) {
    return mApi.getMovieDetail(movieId.toString(), API_KEY, LANGUAGE_EN_US)
        .asStream()
        .map((response) => response)
        .first;
  }
}