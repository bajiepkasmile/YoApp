import '../../../architecture/presentation/view/view_model.dart';
import '../../../implemented_architecture/presentation/scope/app_scope.dart';
import '../../../implemented_architecture/presentation/scope/scope_bundle.dart';
import '../../data/operations/implementation/messages/send_message_operation.dart';
import '../../data/operations/implementation/messages/get_remote_messages_operation.dart';

class YoAppScope extends AppScope<YoAppScope> {

  GetRemoteMessagesOperation getRemoteMessagesOperation;
  SendMessageOperation sendMessageOperation;

  YoAppScope(ScopeBundle<YoAppScope, void, void, ViewModel> bundle) : super(bundle) {
    getRemoteMessagesOperation = GetRemoteMessagesOperation();
    sendMessageOperation = SendMessageOperation();
  }
}
