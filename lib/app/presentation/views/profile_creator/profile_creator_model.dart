import 'dart:io';

import '../../../../flutter_utils/architecture/presentation/view/widget_model_bundle.dart';
import '../../../../flutter_utils/architecture/presentation/view/widget_model.dart';
import '../../../models/input_status.dart';

class ProfileCreatorModel extends WidgetModel<void> {

  File avatarFile;
  String name;
  InputStatus status = InputStatus.inactive;

  ProfileCreatorModel(WidgetModelBundle<void> bundle) : super(bundle);
}
