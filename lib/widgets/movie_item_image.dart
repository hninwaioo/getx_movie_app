import 'package:flutter/material.dart';
import 'package:getx_movie_app/resources/dimens.dart';

class MovieItemImage extends StatelessWidget {
  final String movies_image;
  MovieItemImage(this.movies_image);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.only(topLeft:Radius.circular(8.0) ,topRight: Radius.circular(8.0)),
        child:
        Image.network(
          movies_image,
          height: IMAGE_POSTER_HEIGHT,
          fit:BoxFit.fill,
          width: MOVIE_LIST_ITEM_WIDTH,

        )
    );
  }
}
