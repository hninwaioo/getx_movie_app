import 'package:flutter/material.dart';
import 'package:getx_movie_app/resources/dimens.dart';

class BackButtonView extends StatelessWidget {
  final Function onTapBack;
  BackButtonView(this.onTapBack);
  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: (){
          onTapBack();
        },
        child: Container(
          width: MARGIN_XXLARGE,
          height: MARGIN_XXLARGE,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black54
          ),
          child: Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: MARGIN_XLARGE,
          ),
        ),
      );

  }
}
