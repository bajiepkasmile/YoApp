import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../flutter_utils/architecture/presentation/navigation/target_route.dart';
import '../../../../flutter_utils/architecture/presentation/navigation/targets/target.dart';
import '../../../../architecture/presentation/navigation/route_bundle.dart';
import '../../app/yo_app_scope.dart';
import 'image_source_state.dart';

class ImageSourceRoute extends TargetRoute<YoAppScope, void, ImageSource> {

  ImageSourceRoute(YoAppScope appScope, Target target) : super(appScope, target);

  @override
  State<StatefulWidget> createState(RouteBundle<YoAppScope, void, ImageSource> bundle) => ImageSourceState(bundle);
}
