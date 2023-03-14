import 'package:getx_movie_app/response/vos/movie_vo.dart';
import 'package:json_annotation/json_annotation.dart';
part 'movie_data_response.g.dart';

@JsonSerializable()
class MovieDataResponse{

  @JsonKey(name: "page")
  int? page;

  @JsonKey(name: "results")
  List<MovieVO>? results;

  MovieDataResponse(this.page,this.results);

  factory MovieDataResponse.fromJson(Map<String,dynamic> json) => _$MovieDataResponseFromJson(json);

  Map<String,dynamic> toJson() => _$MovieDataResponseToJson(this);
}