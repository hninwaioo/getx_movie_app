import 'package:flutter/material.dart';
import 'package:getx_movie_app/resources/dimens.dart';
import 'package:getx_movie_app/widgets/TypicalText.dart';
import 'package:intl/intl.dart';

class MoviesReleaseDateView extends StatefulWidget {

  String releaseDate;
  MoviesReleaseDateView(this.releaseDate);

  @override
  State<MoviesReleaseDateView> createState() => _MoviesReleaseDateViewState();
}

class _MoviesReleaseDateViewState extends State<MoviesReleaseDateView> {

  String? formattedDate ;

  @override
  void initState(){
    super.initState();

    final _dateFormatter = DateFormat('dd/MMM/yyyy');
    final dateStr = widget.releaseDate;
    var dateTime = new DateFormat("yyyy-MM-dd").parse(dateStr??"");
    formattedDate = _dateFormatter.format(dateTime);

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(MARGIN_MEDIUM_2),
      child: Flexible(
          child:
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MoviesDurationView("Censor Rating","U/A"),
              Spacer(),
              MoviesDurationView("Release date", formattedDate??""),
              Spacer(),
              MoviesDurationView("Duration","2hr 15min")
            ],
          )
      ),
    );
  }
}

class MoviesDurationView extends StatelessWidget {

  final String text_1;
  final String text;
  MoviesDurationView(this.text_1,this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(MARGIN_MEDIUM,MARGIN_MEDIUM_2,MARGIN_MEDIUM,MARGIN_MEDIUM_2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(34, 34, 34, 1.0),
                Color.fromRGBO(17, 17, 17, 1.0)
              ]
          )
      ),

      child: Column(
        children: [
          TypicalText(text_1, Colors.white, TEXT_REGULAR_SMALL,isFontWeight: true,),
          SizedBox(height: MARGIN_SMALL,),
          TypicalText(text, Colors.white, TEXT_REGULAR,isFontWeight: true,)

        ],
      ),
    );
  }
}
