import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../architecture/presentation/navigation/route_bundle.dart';
import '../../../../flutter_utils/architecture/presentation/scope/scope_bundle.dart';
import '../../../../flutter_utils/architecture/presentation/view/widget_state.dart';
import '../../../../flutter_utils/architecture/presentation/view/widget_model.dart';
import '../../../../flutter_utils/architecture/presentation/view/widget_model_bundle.dart';
import '../../widgets/input_status_widget.dart';
import '../../app/yo_app_scope.dart';
import '../../widgets/splash_logo_widget.dart';
import '../../resources/app_colors.dart';
import 'splash_model.dart';
import 'splash_scope.dart';

class SplashState extends WidgetState<YoAppScope, SplashScope, SplashModel, void, void> {

  SplashState(RouteBundle<YoAppScope, void, void> bundle) : super(bundle);

  @override
  SplashScope createScope(ScopeBundle<YoAppScope, WidgetModel, void, void> bundle) => SplashScope(bundle);

  @override
  SplashModel createViewModel(WidgetModelBundle<void> bundle) => SplashModel(bundle);

  @override
  void initState() {
    super.initState();
    scope.onInitReaction.excite(null);
  }

  @override
  Widget build(BuildContext context) =>
    Material(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLogo(),
              SizedBox(height: 42),
              _buildTitle(),
              _buildSubtitle(),
              SizedBox(height: 40),
              InputStatusWidget(model.status, "Check your internet connection")
            ]
        )
    );

  Widget _buildLogo() {
    final animationCompleter = Completer();
    model.setRefreshFuture(animationCompleter.future);
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [SplashLogoWidget(animationCompleter)]
    );
  }

  Widget _buildTitle() =>
      Text(
          'Become popular!',
          style: TextStyle(
              fontSize: 29,
              fontWeight: FontWeight.bold,
              height: 1.5534,
              color: AppColors.darkGray,
          )
      );

  Widget _buildSubtitle() =>
      RichText(
          text: TextSpan(
              children: [
                  TextSpan(text: 'Collect'),
                  TextSpan(text: ' 1 000 000 ', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: 'likes')
              ],
              style: TextStyle(
                  fontSize: 18,
                  height: 1.5534,
                  color: AppColors.darkGray70,
              )
          )
      );
}
