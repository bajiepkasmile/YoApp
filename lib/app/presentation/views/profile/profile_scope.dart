import '../../../../flutter_utils/architecture/presentation/reaction/simple_on_open_reaction.dart';
import '../../../../flutter_utils/architecture/presentation/scope/scope_bundle.dart';
import '../../../../flutter_utils/architecture/presentation/scope/widget_scope.dart';
import '../../app/yo_app_scope.dart';
import '../contact_invitation/contact_invitation_route.dart';
import '../email/email_route.dart';
import '../image_picker/image_picker_route.dart';
import '../image_source/image_source_route.dart';
import '../image_source/image_source_target.dart';
import '../instagram/instagram_route.dart';
import '../market/market_route.dart';
import '../phone_input/phone_input_route.dart';
import 'reactions/on_change_avatar_reaction.dart';
import 'reactions/on_log_out_reaction.dart';
import 'reactions/on_profile_update_reaction.dart';
import 'profile_model.dart';

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
        appScope.changeAvatarTask,
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
    model.profile = appScope.profileRepository.data;
    appScope.profileRepository.onChangedEmitter.addReaction(onProfileUpdateReaction);
  }

  @override
  void onDeconfigure() {
    appScope.profileRepository.onChangedEmitter.removeReaction(onProfileUpdateReaction);
  }
}
