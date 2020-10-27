import 'package:flutter_utils/architecture/presentation/reaction/simple_on_open_reaction.dart';
import 'package:flutter_utils/architecture/presentation/scope/scope_bundle.dart';
import 'package:flutter_utils/architecture/presentation/scope/widget_scope.dart';
import 'package:yo_app/presentation/app/yo_app_scope.dart';
import 'package:yo_app/presentation/common/log_in/log_in_func.dart';
import 'package:yo_app/presentation/views/main/main_route.dart';
import 'package:yo_app/presentation/views/phone_input/phone_input_model.dart';
import 'package:yo_app/presentation/views/phone_input/reactions/on_phone_changed_reaction.dart';
import 'package:yo_app/presentation/views/phone_input/reactions/on_phone_submitted_reaction.dart';
import 'package:yo_app/presentation/views/profile_creator/profile_creator_route.dart';
import 'package:yo_app/presentation/views/sms_input/sms_input_route.dart';
import 'package:yo_app/presentation/views/terms_of_use/terms_of_use_route.dart';

class PhoneInputScope extends WidgetScope<YoAppScope, PhoneInputModel, void, void> {

  ProfileCreatorRoute profileCreatorRoute;
  MainRoute mainRoute;
  SmsInputRoute smsInputRoute;
  TermsOfUseRoute termsOfUseRoute;

  LogInFunc logInFunc;

  OnPhoneChangedReaction onPhoneChangedReaction;
  OnPhoneSubmittedReaction onPhoneSubmittedReaction;
  SimpleOnOpenReaction onOpenTermsOfUseReaction;

  PhoneInputScope(ScopeBundle<YoAppScope, PhoneInputModel, void, void> bundle) : super(bundle) {
    profileCreatorRoute = ProfileCreatorRoute(appScope, navigatorTarget);
    smsInputRoute = SmsInputRoute(appScope, navigatorTarget);
    termsOfUseRoute = TermsOfUseRoute();

    logInFunc = LogInFunc(appScope.logInTask, appScope.getProfileTask, mainRoute, profileCreatorRoute);

    onPhoneChangedReaction = OnPhoneChangedReaction(model, appScope.phoneFormatter);
    onPhoneSubmittedReaction = OnPhoneSubmittedReaction(
        appScope.isNetworkAvailableFunc,
        appScope.verifyPhoneFunc,
        logInFunc,
        smsInputRoute,
        model
    );
    onOpenTermsOfUseReaction = SimpleOnOpenReaction(termsOfUseRoute);
  }
}
