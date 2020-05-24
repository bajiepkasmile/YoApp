import '../../../../flutter_utils/architecture/presentation/view/widget_model.dart';
import '../../../../flutter_utils/architecture/presentation/view/widget_model_bundle.dart';
import '../../../models/input_status.dart';
import '../../../models/contact.dart';

class ContactModel extends WidgetModel<Contact> {

  InputStatus status;

  ContactModel(WidgetModelBundle<Contact> bundle) : super(bundle);
}
