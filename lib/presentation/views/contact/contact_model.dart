import 'package:flutter_utils/architecture/presentation/view/widget_model.dart';
import 'package:flutter_utils/architecture/presentation/view/widget_model_bundle.dart';
import 'package:yo_app/models/contact.dart';
import 'package:yo_app/models/input_status.dart';

class ContactModel extends WidgetModel<Contact> {

  InputStatus status;

  ContactModel(WidgetModelBundle<Contact> bundle) : super(bundle);
}
