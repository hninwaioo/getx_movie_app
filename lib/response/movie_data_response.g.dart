// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDataResponse _$MovieDataResponseFromJson(Map<String, dynamic> json) =>
    MovieDataResponse(
      json['page'] as int?,
      (json['results'] as List<dynamic>?)
          ?.map((e) => MovieVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieDataResponseToJson(MovieDataResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
    };
