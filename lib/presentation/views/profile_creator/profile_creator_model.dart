import 'dart:io';

import 'package:flutter_utils/architecture/presentation/view/widget_model.dart';
import 'package:flutter_utils/architecture/presentation/view/widget_model_bundle.dart';
import 'package:yo_app/models/input_status.dart';

class ProfileCreatorModel extends WidgetModel<void> {

  File avatarFile;
  String name;
  InputStatus status = InputStatus.inactive;

  ProfileCreatorModel(WidgetModelBundle<void> bundle) : super(bundle);
}
