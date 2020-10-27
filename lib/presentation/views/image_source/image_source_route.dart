import 'package:architecture/presentation/navigation/route_bundle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_utils/architecture/presentation/navigation/target_route.dart';
import 'package:flutter_utils/architecture/presentation/navigation/targets/target.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yo_app/presentation/app/yo_app_scope.dart';
import 'package:yo_app/presentation/views/image_source/image_source_state.dart';

class ImageSourceRoute extends TargetRoute<YoAppScope, void, ImageSource> {

  ImageSourceRoute(YoAppScope appScope, Target target) : super(appScope, target);

  @override
  State<StatefulWidget> createState(RouteBundle<YoAppScope, void, ImageSource> bundle) => ImageSourceState(bundle);
}
