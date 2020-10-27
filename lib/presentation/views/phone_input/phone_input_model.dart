import 'package:flutter_utils/architecture/presentation/view/widget_model.dart';
import 'package:flutter_utils/architecture/presentation/view/widget_model_bundle.dart';
import 'package:yo_app/models/input_status.dart';

class PhoneInputModel extends WidgetModel {

  String phone;
  InputStatus status = InputStatus.inactive;

  PhoneInputModel(WidgetModelBundle bundle) : super(bundle);
}
