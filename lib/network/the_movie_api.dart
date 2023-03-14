import 'package:getx_movie_app/response/movie_data_response.dart';
import 'package:getx_movie_app/response/vos/movie_vo.dart';
import 'package:retrofit/http.dart';
import 'api_constants.dart';
import 'package:dio/dio.dart';

part 'the_movie_api.g.dart';

@RestApi(baseUrl: BASE_URL_DIO)
abstract class TheMovieApi{
  factory TheMovieApi(Dio dio) = _TheMovieApi;

  @GET(ENDPOINT_GET_NOW_PLAYING)
  Future<MovieDataResponse> getNowPlayingMovies(
      @Query(PARAM_API_KEY) String apiKey,
      @Query(PARAM_LANGUAGE) String language,
      @Query(PARAM_PAGE) String page
      );

  @GET("$ENDPOINT_GET_MOVIE_DETAILS/{movie_id}")
  Future<MovieVO> getMovieDetail(
      @Path("movie_id") String movieId,
      @Query(PARAM_API_KEY) String apiKey,
      @Query(PARAM_LANGUAGE) String language,
      );

}