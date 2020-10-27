import 'package:connectivity_utils/architecture/data/emitter/on_connectivity_changed_emitter.dart';
import 'package:flutter_utils/architecture/presentation/scope/scope_bundle.dart';
import 'package:flutter_utils/architecture/presentation/scope/widget_scope.dart';
import 'package:yo_app/presentation/app/yo_app_scope.dart';
import 'package:yo_app/presentation/views/main/main_route.dart';
import 'package:yo_app/presentation/views/phone_input/phone_input_route.dart';
import 'package:yo_app/presentation/views/profile_creator/profile_creator_route.dart';
import 'package:yo_app/presentation/views/splash/reactions/funcs/get_profile_func.dart';
import 'package:yo_app/presentation/views/splash/reactions/on_connectivity_changed_reaction.dart';
import 'package:yo_app/presentation/views/splash/reactions/on_init_reaction.dart';
import 'package:yo_app/presentation/views/splash/splash_model.dart';

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
        appScope.profileBox,
        appScope.profileGeneralInfoSetting,
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
