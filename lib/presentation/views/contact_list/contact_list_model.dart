import 'package:flutter_utils/architecture/presentation/view/widget_model.dart';
import 'package:flutter_utils/architecture/presentation/view/widget_model_bundle.dart';
import 'package:yo_app/models/contact.dart';
import 'package:yo_app/models/input_status.dart';

class ContactListModel extends WidgetModel<void> {

  List<Contact> contacts;
  InputStatus status = InputStatus.active;

  ContactListModel(WidgetModelBundle<void> bundle) : super(bundle);
}
