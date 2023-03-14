import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_movie_app/pages/modules/nowplaying/now_playing_movies_controller.dart';
import 'package:getx_movie_app/resources/colors.dart';
import 'package:getx_movie_app/resources/dimens.dart';
import 'package:getx_movie_app/response/vos/movie_vo.dart';
import 'package:getx_movie_app/routes/app_routes.dart';
import 'package:getx_movie_app/viewitems/movie_list_view_items.dart';
import 'package:getx_movie_app/viewitems/movie_list_view_items_shimmer.dart';

class NowPlayingShowMoviesPage extends StatelessWidget {
  const NowPlayingShowMoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NowPlayingMoviesController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: PRIMARY_COLOR,
          leading: Center(
            child: Text(
              "The Movies",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: TEXT_HEADING_2X,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          leadingWidth: 150,
        ),
        body:
        controller.isLoading
            ?
        // Center(child: CircularProgressIndicator())
        ShimmerView()
            :
        SingleChildScrollView(

          child: Column(
            children: [

              SizedBox(height: MARGIN_MEDIUM,),
              (controller.nowPlayingMovies!=null)
                  ?
              GridView.builder(
                physics: ScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.65,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: controller.nowPlayingMovies?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM),
                    child: MovieListViewItems(
                      onTapMovie: (movieId) {
                        Get.toNamed(AppRoutes.movieDetails,arguments: [controller.nowPlayingMovies![index].id]);
                      },
                      movieVO: controller.nowPlayingMovies![index],
                    ),
                  );
                },
              )
                  :
              Center(
                child: CircularProgressIndicator(),
              ),
              SizedBox(height: MARGIN_MEDIUM,),
            ],
          ),
        ),
      ),
    );
  }
}

class ShimmerView extends StatelessWidget {
  const ShimmerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: ScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.65,
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: 15,
      // controller.nowPlayingMovies?.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM),
          child: MovieListViewItemsShimmer(),
        );
      },
    );

  }
}
