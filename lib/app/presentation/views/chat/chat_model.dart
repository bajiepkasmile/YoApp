import '../../../../flutter_utils/architecture/presentation/view/widget_model_bundle.dart';
import '../../../../flutter_utils/architecture/presentation/view/widget_model.dart';
import '../../../model/message.dart';
import '../../../model/profile.dart';

class ChatModel extends WidgetModel<Profile> {
  
  List<Message> messages;

  ChatModel(WidgetModelBundle<Profile> bundle) : super(bundle);
}
