import 'package:getx_movie_app/response/vos/movie_vo.dart';

abstract class MovieDataAgent{
  Future<List<MovieVO>?> getNowPlayingMovies(int page);
  Future<MovieVO>? getMovieDetail(int movieId);

}