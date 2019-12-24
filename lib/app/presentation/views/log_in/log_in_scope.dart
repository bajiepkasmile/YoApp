import '../../../../flutter_utils/architecture/presentation/scope/scope_bundle.dart';
import '../../../../flutter_utils/architecture/presentation/scope/widget_scope.dart';
import '../../app/yo_app_scope.dart';
import '../profile_creator/profile_creator_route.dart';
import 'reactions/common/log_in_common.dart';
import 'reactions/on_phone_changed_reaction.dart';
import 'reactions/on_phone_submitted_reaction.dart';
import 'reactions/on_sms_code_changed_reaction.dart';
import 'reactions/on_sms_code_submitted_reaction.dart';
import 'log_in_model.dart';

class LogInScope extends WidgetScope<YoAppScope, void, void, LogInModel> {

  ProfileCreatorRoute profileCreatorRoute;
  LogInCommon logInCommon;
  OnPhoneChangedReaction onPhoneChangedReaction;
  OnPhoneSubmittedReaction onPhoneSubmittedReaction;
  OnSmsCodeChangedReaction onSmsCodeChangedReaction;
  OnSmsCodeSubmittedReaction onSmsCodeSubmittedReaction;

  LogInScope(ScopeBundle<YoAppScope, void, void, LogInModel> bundle) : super(bundle) {
    profileCreatorRoute = ProfileCreatorRoute(context, appScope, null);
    logInCommon = LogInCommon(appScope.logInTask, appScope.getRemoteSelfProfileTask, profileCreatorRoute);
    onPhoneChangedReaction = OnPhoneChangedReaction(viewModel);
    onPhoneSubmittedReaction = OnPhoneSubmittedReaction(viewModel, appScope.verifyPhoneOperation, logInCommon);
    onSmsCodeChangedReaction = OnSmsCodeChangedReaction(viewModel);
    onSmsCodeSubmittedReaction = OnSmsCodeSubmittedReaction(viewModel, logInCommon);
  }
}
