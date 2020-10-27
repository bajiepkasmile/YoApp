import 'package:flutter_utils/architecture/presentation/reaction/simple_on_back_reaction.dart';
import 'package:flutter_utils/architecture/presentation/scope/scope_bundle.dart';
import 'package:flutter_utils/architecture/presentation/scope/widget_scope.dart';
import 'package:yo_app/presentation/app/yo_app_scope.dart';
import 'package:yo_app/presentation/common/log_in/log_in_func.dart';
import 'package:yo_app/presentation/views/main/main_route.dart';
import 'package:yo_app/presentation/views/profile_creator/profile_creator_route.dart';
import 'package:yo_app/presentation/views/sms_input/reactions/funcs/log_in_by_sms_code_func.dart';
import 'package:yo_app/presentation/views/sms_input/reactions/funcs/start_timer_func.dart';
import 'package:yo_app/presentation/views/sms_input/reactions/on_init_reaction.dart';
import 'package:yo_app/presentation/views/sms_input/reactions/on_send_sms_reaction.dart';
import 'package:yo_app/presentation/views/sms_input/reactions/on_sms_code_changed_reaction.dart';
import 'package:yo_app/presentation/views/sms_input/reactions/on_sms_code_submitted_reaction.dart';
import 'package:yo_app/presentation/views/sms_input/sms_input_arg.dart';
import 'package:yo_app/presentation/views/sms_input/sms_input_model.dart';

class SmsInputScope extends WidgetScope<YoAppScope, SmsInputModel, SmsInputArg, void> {

  ProfileCreatorRoute profileCreatorRoute;
  MainRoute mainRoute;

  LogInFunc logInFunc;
  LogInBySmsCodeFunc logInBySmsCodeFunc;
  StartTimerFunc startTimerFunc;

  OnInitReaction onInitReaction;
  SimpleOnBackReaction onBackReaction;
  OnSendSmsReaction onSendSmsReaction;
  OnSmsCodeChangedReaction onSmsCodeChangedReaction;
  OnSmsCodeSubmittedReaction onSmsCodeSubmittedReaction;

  SmsInputScope(ScopeBundle<YoAppScope, SmsInputModel, void, void> bundle) : super(bundle) {
    profileCreatorRoute = ProfileCreatorRoute(appScope, navigatorTarget);
    mainRoute = MainRoute(appScope, navigatorTarget);

    logInFunc = LogInFunc(appScope.logInTask, appScope.getProfileTask, mainRoute, profileCreatorRoute);
    logInBySmsCodeFunc = LogInBySmsCodeFunc(model, appScope.isNetworkAvailableFunc, logInFunc);
    startTimerFunc = StartTimerFunc(model);

    onInitReaction = OnInitReaction(startTimerFunc);
    onBackReaction = SimpleOnBackReaction(trace);
    onSmsCodeChangedReaction = OnSmsCodeChangedReaction(model, logInBySmsCodeFunc);
    onSmsCodeSubmittedReaction = OnSmsCodeSubmittedReaction(logInBySmsCodeFunc);
    onSendSmsReaction = OnSendSmsReaction(
        appScope.isNetworkAvailableFunc,
        appScope.verifyPhoneFunc,
        startTimerFunc,
        model
    );
  }
}
