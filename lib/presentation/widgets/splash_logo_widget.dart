import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yo_app/presentation/resources/app_colors.dart';
import 'package:yo_app/presentation/resources/app_images.dart';

class SplashLogoWidget extends StatefulWidget {

  final Completer _animationCompleter;

  SplashLogoWidget(this._animationCompleter);

  @override
  State<StatefulWidget> createState() => SplashLogoWidgetState(_animationCompleter);
}

class SplashLogoWidgetState extends State<StatefulWidget> with SingleTickerProviderStateMixin<StatefulWidget> {

  static const minContainerSize = 140.0;
  static const maxBorderRadius = 52.0;
  static const animationDuration = 700;

  final Completer _animationCompleter;

  AnimationController _controller;
  Animation _borderRadiusAnimation;
  Animation _widthAnimation;
  Animation _heightAnimation;

  SplashLogoWidgetState(this._animationCompleter);

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: animationDuration));

    final easeCurve = CurvedAnimation(parent: _controller, curve: Curves.ease);
    final easeOutQuartCurve = CurvedAnimation(parent: _controller, curve: Curves.easeOutQuart);
    final screenSize = MediaQuery.of(context).size;

    _widthAnimation = Tween(begin: screenSize.width, end: minContainerSize).animate(easeCurve);
    _heightAnimation = Tween(begin: screenSize.height, end: minContainerSize).animate(easeOutQuartCurve);
    _borderRadiusAnimation = Tween(begin: 0.0, end: maxBorderRadius).animate(easeCurve);

    await _controller.forward();
    _animationCompleter.complete();
  }

  @override
  Widget build(BuildContext context) =>
      AnimatedBuilder(animation: _controller, builder: (context, child) => buildBody());

  Widget buildBody() => Container(
      width: _widthAnimation.value,
      height: _heightAnimation.value,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColors.yellow,
          borderRadius: BorderRadius.circular(_borderRadiusAnimation.value)
      ),
      child: Center(child: Image.asset(AppImages.imgEmojiSunglassesBig))
  );
}
