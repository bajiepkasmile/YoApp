import '../../../../flutter_utils/architecture/presentation/view/widget_model.dart';
import '../../../../flutter_utils/architecture/presentation/view/widget_model_bundle.dart';
import '../../../models/input_status.dart';
import '../../../models/contact.dart';

class ContactListModel extends WidgetModel<void> {

  List<Contact> contacts;
  InputStatus status = InputStatus.active;

  ContactListModel(WidgetModelBundle<void> bundle) : super(bundle);
}
