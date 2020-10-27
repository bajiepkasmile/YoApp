import 'package:flutter_utils/architecture/presentation/view/widget_model.dart';
import 'package:flutter_utils/architecture/presentation/view/widget_model_bundle.dart';
import 'package:yo_app/models/contact.dart';
import 'package:yo_app/models/input_status.dart';

class NewContactModel extends WidgetModel<void> {

  String phone;
  String lastSearchedPhone;
  InputStatus status = InputStatus.inactive;
  Contact contact;

  bool get canInvite => phone!= null && phone == lastSearchedPhone;

  NewContactModel(WidgetModelBundle<void> bundle) : super(bundle);
}
