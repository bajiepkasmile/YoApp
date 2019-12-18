import '../../../../implemented_architecture/presentation/view/view_state.dart';
import '../../../../implemented_architecture/presentation/view/widget_model.dart';
import '../../../model/message.dart';
import '../../../model/profile.dart';

class ChatModel extends WidgetModel {
  
  final Profile contact;

  List<Message> messages;

  ChatModel(ViewState viewState, this.contact) : super(viewState);
}
