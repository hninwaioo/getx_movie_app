import 'package:getx_movie_app/model/movie_model.dart';
import 'package:getx_movie_app/network/movie_data_agent.dart';
import 'package:getx_movie_app/network/retrofit_data_agent_impl.dart';
import 'package:getx_movie_app/response/vos/movie_vo.dart';

class MovieModelImpl extends MovieModel {

  MovieDataAgent mDataAgent = RetrofitDataAgentImpl();

  static final MovieModelImpl _singleton = MovieModelImpl._internal();

  factory MovieModelImpl(){
    return _singleton;
  }
  MovieModelImpl._internal();

  @override
  Future<List<MovieVO>?> getNowPlayingMovies(int page) {
    return mDataAgent.getNowPlayingMovies(page)
        .then((movieList) async {
      return Future.value(movieList);
    });
  }

  @override
  Future<MovieVO>? getMovieDetail(int movieId) {
    return mDataAgent.getMovieDetail(movieId)?.then((movie) async {
      return Future.value(movie);
    });
  }

}