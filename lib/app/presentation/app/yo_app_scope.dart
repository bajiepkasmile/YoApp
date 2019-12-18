import '../../../architecture/presentation/view/view_model.dart';
import '../../../implemented_architecture/presentation/scope/app_scope.dart';
import '../../../implemented_architecture/presentation/scope/scope_bundle.dart';
import '../../data/operations/implementation/auth/confirm_log_in_operation.dart';
import '../../data/operations/implementation/auth/log_in_operation.dart';
import '../../data/operations/implementation/messages/get_remote_messages_operation.dart';
import '../../data/operations/implementation/messages/send_message_operation.dart';
import '../../data/repositories/self_profile_repository.dart';
import '../views/log_in/log_in_route.dart';
import 'reactions/on_init_reaction.dart';

class YoAppScope extends AppScope<YoAppScope> {

  LogInOperation logInOperation;
  ConfirmLogInOperation confirmLogInOperation;
  GetRemoteMessagesOperation getRemoteMessagesOperation;
  SendMessageOperation sendMessageOperation;
  SelfProfileRepository selfProfileRepository;
  LogInRoute logInRoute;
  OnInitReaction onInitReaction;

  YoAppScope(ScopeBundle<YoAppScope, void, void, ViewModel> bundle) : super(bundle) {
    logInOperation = LogInOperation();
    confirmLogInOperation = ConfirmLogInOperation();
    getRemoteMessagesOperation = GetRemoteMessagesOperation();
    sendMessageOperation = SendMessageOperation();
    selfProfileRepository = SelfProfileRepository();
    logInRoute = LogInRoute(context, this, screenContainer);
    onInitReaction = OnInitReaction(logInRoute);
  }
}
