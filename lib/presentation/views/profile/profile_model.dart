import 'package:flutter_utils/architecture/presentation/view/widget_model.dart';
import 'package:flutter_utils/architecture/presentation/view/widget_model_bundle.dart';
import 'package:yo_app/models/profile.dart';

class ProfileModel extends WidgetModel<void> {

  Profile profile;

  ProfileModel(WidgetModelBundle<void> bundle) : super(bundle);
}
