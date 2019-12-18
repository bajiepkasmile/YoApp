import '../../../../implemented_architecture/presentation/scope/scope_bundle.dart';
import '../../../../implemented_architecture/presentation/scope/widget_scope.dart';
import '../../app/yo_app_scope.dart';
import 'reactions/on_phone_changed_reaction.dart';
import 'reactions/on_phone_submitted_reaction.dart';
import 'reactions/on_sms_code_changed_reaction.dart';
import 'reactions/on_sms_code_submitted_reaction.dart';
import 'log_in_model.dart';

class LogInScope extends WidgetScope<YoAppScope, void, void, LogInModel> {

  OnPhoneChangedReaction onPhoneChangedReaction;
  OnPhoneSubmittedReaction onPhoneSubmittedReaction;
  OnSmsCodeChangedReaction onSmsCodeChangedReaction;
  OnSmsCodeSubmittedReaction onSmsCodeSubmittedReaction;

  LogInScope(ScopeBundle<YoAppScope, void, void, LogInModel> bundle) : super(bundle) {
    onPhoneChangedReaction = OnPhoneChangedReaction(viewModel);
    onPhoneSubmittedReaction = OnPhoneSubmittedReaction(viewModel, appScope.logInOperation);
    onSmsCodeChangedReaction = OnSmsCodeChangedReaction(viewModel);
    onSmsCodeSubmittedReaction = OnSmsCodeSubmittedReaction(
        viewModel,
        appScope.confirmLogInOperation,
        appScope.selfProfileRepository
    );
  }
}
