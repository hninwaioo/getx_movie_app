import 'package:flutter/material.dart';
import 'package:getx_movie_app/network/api_constants.dart';
import 'package:getx_movie_app/resources/dimens.dart';
import 'package:getx_movie_app/response/vos/movie_vo.dart';
import 'package:getx_movie_app/widgets/TypicalText.dart';
import 'package:getx_movie_app/widgets/movie_item_image.dart';
import 'package:getx_movie_app/widgets/rating_view.dart';
import 'package:intl/intl.dart';

class MovieListViewItems extends StatelessWidget {
  MovieListViewItems({
    super.key,
    required this.movieVO,
    required this.onTapMovie,
  });
  final MovieVO movieVO;
  final Function(int) onTapMovie;

  @override
  Widget build(BuildContext context) {

    return Container(
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(MARGIN_MEDIUM))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () =>
                  onTapMovie(1),
                child: Container(
                  height: MediaQuery.of(context).size.height/4,
                  child: MovieItemImage(
                    "$IMAGE_BASE_URL${movieVO.posterPath}",
                  ),

                )
            ),

            SizedBox(height: MARGIN_MEDIUM,),

            Container(
              margin: EdgeInsets.all(MARGIN_MEDIUM),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  TypicalText(movieVO.title??"", Colors.white, TEXT_REGULAR_2x, isFontWeight700: true,),
                  SizedBox(height: MARGIN_MEDIUM,),
                  Row(
                    children: [

                      RatingView(ratingAverage: movieVO.voteAverage??0.0),
                      SizedBox(width: MARGIN_MEDIUM,),
                      Text(
                        movieVO.voteAverage.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: TEXT_REGULAR
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        )
    );

  }
}