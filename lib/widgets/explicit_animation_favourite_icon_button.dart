import 'package:flutter/material.dart';
import 'package:getx_movie_app/resources/dimens.dart';

const kAnimationDurationForFavourite = const Duration(milliseconds: 1000);

class ExplicitAnimationFavouriteIconButton extends StatefulWidget {
  const ExplicitAnimationFavouriteIconButton({Key? key}) : super(key: key);

  @override
  State<ExplicitAnimationFavouriteIconButton> createState() => _ExplicitAnimationFavouriteIconButtonState();
}

class _ExplicitAnimationFavouriteIconButtonState extends State<ExplicitAnimationFavouriteIconButton> with TickerProviderStateMixin{
  ///State
  bool isAnimationComplete = false;

  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _sizeAnimation;

  @override
  void initState(){
    super.initState();
    _controller = AnimationController(
        duration: kAnimationDurationForFavourite,
        vsync: this
    );
    _colorAnimation = ColorTween(
        begin: Colors.white,
        end: Colors.red
    ).animate(_controller.view);

    _sizeAnimation = Tween(
        begin: kMarginXLarge,
        end: kMarginXXLarge)
        .animate(_controller.view);

    _controller.addStatusListener((status) {
      isAnimationComplete = (status == AnimationStatus.completed);
    });
  }


  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller.view,
      builder: (context, _) => IconButton(
          iconSize: 36,
          onPressed: (){
            if(isAnimationComplete){
              _controller.reverse();
            }else{
              _controller.forward();
            }
            // _controller.repeat();
          },
          icon: Icon(Icons.favorite,
              color: _colorAnimation.value,
              size: _sizeAnimation.value)
      ),


    );
  }
  @override
  void onDispose(){
    _controller.dispose();
    super.dispose();
  }

}
