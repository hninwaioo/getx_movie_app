import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_movie_app/pages/modules/moviedetails/movie_detail_controller.dart';
import 'package:getx_movie_app/resources/colors.dart';
import 'package:getx_movie_app/resources/dimens.dart';
import 'package:getx_movie_app/network/api_constants.dart';
import 'package:getx_movie_app/response/vos/movie_vo.dart';
import 'package:getx_movie_app/widgets/TypicalText.dart';
import 'package:getx_movie_app/widgets/back_button_view.dart';
import 'package:getx_movie_app/widgets/explicit_animation_favourite_icon_button.dart';
import 'package:getx_movie_app/widgets/movie_detail_message_view.dart';
import 'package:getx_movie_app/widgets/movie_release_date_view.dart';

class MovieDetailViewPage extends StatelessWidget {
  const MovieDetailViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return GetBuilder<MovieDetailController>(
        builder: (controller) =>

        // (controller.isLoading)
        //     ?
        // Center(child: CircularProgressIndicator())
        //     :
        (controller.mMoviesDetail.isEmpty)
            ?
        Center(child: CircularProgressIndicator())
            :
        Stack(
              children: [
                Positioned.fill(
                  child: Container(
                      color: PRIMARY_COLOR,
                      child:
                      (controller.mMoviesDetail != null)
                          ?
                      CustomScrollView(
                              slivers: [
                                MovieDetailsSliverAppBarView(
                                    () => Navigator.pop(context),
                                    controller.mMoviesDetail[0]
                                ),
                                SliverList(
                                    delegate: SliverChildListDelegate([
                                  SizedBox(
                                    height: MARGIN_MEDIUM_2,
                                  ),
                                  MoviesReleaseDateView(
                                      controller.mMoviesDetail[0].releaseDate ?? ""),
                                  SizedBox(
                                    height: MARGIN_MEDIUM,
                                  ),
                                  // Visibility(
                                  //   visible: movieMessage,
                                  //   child:
                                    MovieDetailMessageView(),
                                  // ),
                                  SizedBox(
                                    height: MARGIN_MEDIUM,
                                  ),
                                  StoryLineView(controller.mMoviesDetail[0].overview ?? ""),
                                  SizedBox(
                                    height: MARGIN_MEDIUM_LARGE,
                                  ),
                                ]))
                              ],
                            )
                          :


                      Center(
                              child: CircularProgressIndicator(),
                            )
                  ),
                ),
              ],
            )
     
    );
  }
}

class MovieDetailsSliverAppBarView extends StatelessWidget {
  final Function onTapBack;
  MovieVO? mMovie;
  MovieDetailsSliverAppBarView(this.onTapBack, this.mMovie);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: PRIMARY_COLOR,
      expandedHeight: MOVIE_DETAILS_SCREEN_APP_BAR_HEIGHT,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Positioned(
                top: 0.0,
                left: 0,
                right: 0,
                height: MediaQuery.of(context).size.height / 3.5,
                child: MovieDetailsAppBarImageView(
                    mMovie?.backDropPath ?? "")), //Positioned
            /** Positioned WIdget **/

            Positioned(
                top: 160,
                left: 16,
                child: ImageOverlapView(mMovie?.posterPath ?? "")
                ), //Positioned

            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding:
                    EdgeInsets.only(top: MARGIN_XXLARGE, left: MARGIN_MEDIUM_2),
                child: BackButtonView(() => onTapBack()),
              ),
            ),

            Align(
              alignment: Alignment.topRight,
              child: Padding(
                  padding: EdgeInsets.only(
                      top: MARGIN_XXLARGE + MARGIN_MEDIUM,
                      right: MARGIN_MEDIUM_LARGE),
                  child: ExplicitAnimationFavouriteIconButton()),
            ),

            Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  margin: EdgeInsets.only(left: MARGIN_MEDIUM),
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.only(left: MARGIN_MEDIUM_LARGE),
                  height: 220,
                  width: MediaQuery.of(context).size.width / 1.6,
                  child: MoviesTypesView(
                    movieVO: mMovie,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class ImageOverlapView extends StatelessWidget {
  String mImageUrl;
  ImageOverlapView(this.mImageUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Row(
        children: [
          Image.network(
            "$IMAGE_BASE_URL$mImageUrl",
            height: IMAGE_POSTER_HEIGHT,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}

class MoviesTypesView extends StatelessWidget {
  MovieVO? movieVO;

  MoviesTypesView({this.movieVO});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            movieVO?.originalTitle ?? "",
            style: TextStyle(
                color: Colors.white,
                fontSize: TEXT_REGULAR_2x,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: MARGIN_SMALL,
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              SizedBox(
                width: MARGIN_SMALL,
              ),
              TypicalText("${movieVO?.voteCount} VOTES", Colors.white,
                  TEXT_REGULAR_VERY_SMALL,
                  isFontWeight: false),
              SizedBox(
                width: MARGIN_MEDIUM,
              ),
              TypicalText(movieVO?.voteAverage.toString() ?? "", Colors.white,
                  TEXT_REGULAR_2x,
                  isFontWeight500: true),
            ],
          ),
          SizedBox(
            height: MARGIN_SMALL,
          ),
          TypicalText(
            "2D,3D,3D IMAX,3D DBOX",
            Colors.white,
            TEXT_REGULAR,
            isFontWeight700: true,
          ),
          SizedBox(
            height: MARGIN_SMALL,
          ),
          MoviesTypesList(
              genreList:
                  movieVO?.genres?.map((genre) => genre.name).toList() ?? []),
        ],
      ),
    );
  }
}

class MovieDetailsAppBarImageView extends StatelessWidget {
  String mImageUrl;
  MovieDetailsAppBarImageView(this.mImageUrl);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            left: 0.0,
            right: 0.0,
            top: 0.0,
            child: Image.network(
              "$IMAGE_BASE_URL$mImageUrl",
              height: MediaQuery.of(context).size.height / 3, //2,
              fit: BoxFit.cover,
            )),
        Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.play_circle,
              color: Colors.amberAccent,
              size: PLAY_BUTTON_SIZE,
            ))
      ],
    );
  }
}

// class MovieDetailAppBarInfoView extends StatelessWidget {
//
//   MovieVO? mMovie;
//   MovieDetailAppBarInfoView(this.mMovie);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Row(
//           children: [
//             MovieDetailYearView(mMovie?.releaseDate?.substring(0,4)),
//             Spacer(),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     RatingView(ratingAverage: mMovie?.voteAverage??0.0),
//                     SizedBox(height: MARGIN_SMALL,),
//                     TypicalText("${mMovie?.voteCount} VOTES", Colors.white,TEXT_REGULAR_2x),
//                     SizedBox(height: MARGIN_CARD_MEDIUM_2,)
//                   ],
//                 ),
//                 SizedBox(width: MARGIN_MEDIUM_2,),
//                 Text(
//                   "${mMovie?.voteAverage}",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: MOVIE_DETAILS_RATING_TEXT_SIZE,
//
//                   ),
//                 )
//               ],
//             )
//           ],
//         ),
//         SizedBox(height: MARGIN_MEDIUM,),
//         Text(
//           mMovie?.title?? "",
//           style: TextStyle(
//               color: Colors.white,
//               fontSize: TEXT_HEADING_2X,
//               fontWeight: FontWeight.bold
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class MovieDetailYearView extends StatelessWidget {
//
//   String? year;
//   MovieDetailYearView(this.year);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
//       height: MARGIN_XXLARGE,
//       decoration: BoxDecoration(
//         color: PLAY_BUTTON_COLOR,
//         borderRadius: BorderRadius.circular(MARGIN_MEDIUM_LARGE),
//       ),
//       child: Center(
//         child: Text(
//           year?? "",
//           style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold
//           ),
//         ),
//       ),
//     );
//   }
// }

class MoviesTypesList extends StatelessWidget {
  const MoviesTypesList({
    Key? key,
    required this.genreList,
  }) : super(key: key);
  final List<String?> genreList;

  @override
  Widget build(BuildContext context) {
    return Wrap(
        children:
            genreList.map((genre) => GenreChipView(genre ?? "")).toList());
  }
}

class GenreChipView extends StatelessWidget {
  final String genreText;
  GenreChipView(this.genreText);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Chip(
            backgroundColor: Colors.blue,
            label: Text(
              genreText,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
        SizedBox(
          width: MARGIN_SMALL,
        )
      ],
    );
  }
}

class StoryLineView extends StatelessWidget {
  String storyLineBody;
  StoryLineView(this.storyLineBody);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(MARGIN_MEDIUM_2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TypicalText(
            "Story Line",
            Colors.white,
            TEXT_REGULAR_1X,
            isFontWeight: true,
          ),
          SizedBox(
            height: MARGIN_MEDIUM_2,
          ),
          Text(
            storyLineBody,
            style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
                fontSize: TEXT_REGULAR,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: MARGIN_MEDIUM_2,
          ),
        ],
      ),
    );
  }
}
