import '../../../../flutter_utils/architecture/presentation/view/widget_model.dart';
import '../../../../flutter_utils/architecture/presentation/view/widget_model_bundle.dart';
import '../../../models/contact.dart';

class ChatListModel extends WidgetModel<void> {

  List<Contact> contacts = [];

  ChatListModel(WidgetModelBundle<void> bundle) : super(bundle);
}
