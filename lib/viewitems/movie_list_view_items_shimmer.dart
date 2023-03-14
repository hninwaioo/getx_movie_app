import 'package:flutter/material.dart';
import 'package:getx_movie_app/resources/dimens.dart';
import 'package:getx_movie_app/widgets/TypicalText.dart';
import 'package:getx_movie_app/widgets/movie_item_image.dart';
import 'package:shimmer/shimmer.dart';

class MovieListViewItemsShimmer extends StatelessWidget {
  const MovieListViewItemsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black26,
      highlightColor: Colors.black12,
      child:
      // Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      //   child: Row(
      //     children: [
      //       Container(
      //         width: MoviePoster.width,
      //         height: MoviePoster.height,
      //         color: Colors.black,
      //       ),
      //       const SizedBox(width: 8),
      //       Expanded(
      //         child: Column(
      //           mainAxisSize: MainAxisSize.min,
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Container(
      //               width: double.infinity,
      //               height: 20.0,
      //               color: Colors.black,
      //               margin: const EdgeInsets.only(bottom: 8.0),
      //             ),
      //             Container(
      //               width: 100.0,
      //               height: 15.0,
      //               color: Colors.black,
      //             )
      //           ],
      //         ),
      //       )
      //     ],
      //   ),
      // ),
      Container(
          // decoration: BoxDecoration(
          //     color: Colors.black,
          //     borderRadius: BorderRadius.all(Radius.circular(MARGIN_MEDIUM))
          // ),
          margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                  Container(
                    color: Colors.black,
                    height: MediaQuery.of(context).size.height/4,
                    child: MovieItemImage(
                      "",
                    ),
                  ),
              SizedBox(height: MARGIN_MEDIUM,),

              Container(
                margin: EdgeInsets.all(MARGIN_MEDIUM),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Container(
                      width: double.infinity,
                      height: 20.0,
                      color: Colors.black,
                      margin: const EdgeInsets.only(bottom: 8.0),
                    ),
                    Container(
                      width: 100.0,
                      height: 15.0,
                      color: Colors.black,
                    )
                  ]
                ),
              ),
            ],
          )
      )
    );
  }
}