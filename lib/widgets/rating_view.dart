import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../resources/dimens.dart';

class RatingView extends StatefulWidget {
  // const RatingView({Key? key}) : super(key: key);
  RatingView(
      {super.key, required this.ratingAverage});
  double? ratingAverage;

  @override
  State<RatingView> createState() => _RatingViewState();
}

class _RatingViewState extends State<RatingView> {
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: widget.ratingAverage??0.0,
      allowHalfRating: true,
      itemBuilder: (BuildContext context, int index){
        return Icon(
          Icons.star,
          color: Colors.amber,
        );
      },
      itemSize: MARGIN_MEDIUM_2,
      onRatingUpdate: (rating) {
        setState(() {
          widget.ratingAverage = rating;
        });
      },
    );
  }
}