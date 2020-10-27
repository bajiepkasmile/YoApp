import 'package:flutter_utils/architecture/presentation/reaction/simple_on_open_reaction.dart';
import 'package:flutter_utils/architecture/presentation/scope/scope_bundle.dart';
import 'package:flutter_utils/architecture/presentation/scope/widget_scope.dart';
import 'package:yo_app/presentation/app/yo_app_scope.dart';
import 'package:yo_app/presentation/views/contact_invitation/contact_invitation_route.dart';
import 'package:yo_app/presentation/views/email/email_route.dart';
import 'package:yo_app/presentation/views/image_picker/image_picker_route.dart';
import 'package:yo_app/presentation/views/image_source/image_source_route.dart';
import 'package:yo_app/presentation/views/image_source/image_source_target.dart';
import 'package:yo_app/presentation/views/instagram/instagram_route.dart';
import 'package:yo_app/presentation/views/market/market_route.dart';
import 'package:yo_app/presentation/views/phone_input/phone_input_route.dart';
import 'package:yo_app/presentation/views/profile/profile_model.dart';
import 'package:yo_app/presentation/views/profile/reactions/on_change_avatar_reaction.dart';
import 'package:yo_app/presentation/views/profile/reactions/on_log_out_reaction.dart';
import 'package:yo_app/presentation/views/profile/reactions/on_profile_update_reaction.dart';

class ProfileScope extends WidgetScope<YoAppScope, ProfileModel, void, void> {

  ImageSourceTarget imageSourceTarget;

  ImageSourceRoute imageSourceRoute;
  ImagePickerRoute imagePickerRoute;
  ContactInvitationRoute contactInvitationRoute;
  InstagramRoute instagramRoute;
  MarketRoute marketRoute;
  EmailRoute emailRoute;
  PhoneInputRoute phoneInputRoute;

  OnProfileUpdateReaction onProfileUpdateReaction;
  OnChangeAvatarReaction onChangeAvatarReaction;
  SimpleOnOpenReaction onShareReaction;
  SimpleOnOpenReaction onOpenInstagramReaction;
  SimpleOnOpenReaction onInviteFriendsReaction;
  SimpleOnOpenReaction onRateReaction;
  SimpleOnOpenReaction onWriteToDevelopersReaction;
  OnLogOutReaction onLogOutReaction;

  ProfileScope(ScopeBundle<YoAppScope, ProfileModel, void, void> bundle) : super(bundle) {
    imageSourceTarget = ImageSourceTarget(context);

    imageSourceRoute = ImageSourceRoute(appScope, imageSourceTarget);
    contactInvitationRoute = ContactInvitationRoute();
    instagramRoute = InstagramRoute();
    marketRoute = MarketRoute();
    emailRoute = EmailRoute();
    phoneInputRoute = PhoneInputRoute(appScope, navigatorTarget);

    onProfileUpdateReaction = OnProfileUpdateReaction(model);
    onChangeAvatarReaction = OnChangeAvatarReaction(
        imageSourceRoute,
        imagePickerRoute,
        appScope.setAvatarTask,
        model
    );
    onShareReaction = SimpleOnOpenReaction(contactInvitationRoute);
    onOpenInstagramReaction = SimpleOnOpenReaction(instagramRoute);
    onInviteFriendsReaction = SimpleOnOpenReaction(contactInvitationRoute);
    onRateReaction = SimpleOnOpenReaction(marketRoute);
    onWriteToDevelopersReaction = SimpleOnOpenReaction(emailRoute);
    onLogOutReaction = OnLogOutReaction(appScope.logOutTask, phoneInputRoute);
  }

  @override
  void onConfigure() {
    model.profile = appScope.profileBox.data;
    appScope.profileBox.onChangedEmitter.addReaction(onProfileUpdateReaction);
  }

  @override
  void onDeconfigure() {
    appScope.profileBox.onChangedEmitter.removeReaction(onProfileUpdateReaction);
  }
}
