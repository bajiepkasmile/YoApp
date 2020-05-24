import '../../../../connectivity_utils/architecture/data/emitter/on_connectivity_changed_emitter.dart';
import '../../../../flutter_utils/architecture/presentation/scope/scope_bundle.dart';
import '../../../../flutter_utils/architecture/presentation/scope/widget_scope.dart';
import '../../app/yo_app_scope.dart';
import '../profile_creator/profile_creator_route.dart';
import '../main/main_route.dart';
import '../phone_input/phone_input_route.dart';
import 'reactions/funcs/get_profile_func.dart';
import 'reactions/on_connectivity_changed_reaction.dart';
import 'reactions/on_init_reaction.dart';
import 'splash_model.dart';

class SplashScope extends WidgetScope<YoAppScope, SplashModel, void, void> {

  OnConnectivityChangedEmitter onConnectivityChangedEmitter;

  GetProfileFunc getProfileFunc;

  PhoneInputRoute phoneInputRoute;
  ProfileCreatorRoute profileCreatorRoute;
  MainRoute mainRoute;

  OnInitReaction onInitReaction;
  OnConnectivityChangedReaction onConnectivityChangedReaction;

  SplashScope(ScopeBundle<YoAppScope, SplashModel, void, void> bundle) : super(bundle) {
    onConnectivityChangedEmitter = appScope.onConnectivityChangedEmitter;

    getProfileFunc = GetProfileFunc(
        appScope.getProfileTask,
        mainRoute,
        profileCreatorRoute,
        model
    );

    phoneInputRoute = PhoneInputRoute(appScope, navigatorTarget);
    mainRoute = MainRoute(appScope, navigatorTarget);

    onInitReaction = OnInitReaction(
        appScope.profileRepository,
        appScope.profileSetting,
        appScope.logInInfoSetting,
        appScope.isNetworkAvailableFunc,
        appScope.getProfileTask,
        mainRoute,
        phoneInputRoute,
        getProfileFunc,
        model
    );
    onConnectivityChangedReaction = OnConnectivityChangedReaction(getProfileFunc, model);
  }

  @override
  void onConfigure() {
    onConnectivityChangedEmitter.addReaction(onConnectivityChangedReaction);
  }

  @override
  void onDeconfigure() {
    onConnectivityChangedEmitter.removeReaction(onConnectivityChangedReaction);
  }
}
