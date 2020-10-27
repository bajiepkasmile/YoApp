import 'package:flutter_utils/architecture/presentation/view/widget_model.dart';
import 'package:flutter_utils/architecture/presentation/view/widget_model_bundle.dart';
import 'package:yo_app/models/contact.dart';

class ChatListModel extends WidgetModel<void> {

  List<Contact> contacts = [];

  ChatListModel(WidgetModelBundle<void> bundle) : super(bundle);
}
