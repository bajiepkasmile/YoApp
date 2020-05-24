import '../../../../flutter_utils/architecture/presentation/reaction/simple_on_open_reaction.dart';
import '../../../../flutter_utils/architecture/presentation/scope/scope_bundle.dart';
import '../../../../flutter_utils/architecture/presentation/scope/widget_scope.dart';
import '../../app/yo_app_scope.dart';
import '../../common/log_in/log_in_func.dart';
import '../terms_of_use/terms_of_use_route.dart';
import '../profile_creator/profile_creator_route.dart';
import '../main/main_route.dart';
import '../sms_input/sms_input_route.dart';
import 'reactions/on_phone_changed_reaction.dart';
import 'reactions/on_phone_submitted_reaction.dart';
import 'phone_input_model.dart';

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
        appScope.verifyPhoneRequest,
        logInFunc,
        smsInputRoute,
        model
    );
    onOpenTermsOfUseReaction = SimpleOnOpenReaction(termsOfUseRoute);
  }
}
