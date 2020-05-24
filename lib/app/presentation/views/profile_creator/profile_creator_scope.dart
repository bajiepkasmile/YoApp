import '../../../../flutter_utils/architecture/presentation/reaction/simple_on_back_reaction.dart';
import '../../../../flutter_utils/architecture/presentation/scope/scope_bundle.dart';
import '../../../../flutter_utils/architecture/presentation/scope/widget_scope.dart';
import '../../app/yo_app_scope.dart';
import '../image_source/image_source_route.dart';
import '../image_source/image_source_target.dart';
import '../image_picker/image_picker_route.dart';
import '../image_cropper/image_cropper_route.dart';
import '../main/main_route.dart';
import 'reactions/on_change_avatar_reaction.dart';
import 'reactions/on_name_changed_reaction.dart';
import 'reactions/on_create_profile_reaction.dart';
import 'profile_creator_model.dart';

class ProfileCreatorScope extends WidgetScope<YoAppScope, ProfileCreatorModel, void, void> {

  ImageSourceTarget imageSourceTarget;

  ImageSourceRoute imageSourceRoute;
  ImagePickerRoute imagePickerRoute;
  ImageCropperRoute imageCropperRoute;
  MainRoute mainRoute;

  SimpleOnBackReaction onBackReaction;
  OnChangeAvatarReaction onChangeAvatarReaction;
  OnNameChangedReaction onNameChangedReaction;
  OnCreateProfileReaction onCreateProfileReaction;

  ProfileCreatorScope(ScopeBundle<YoAppScope, ProfileCreatorModel, void, void> bundle) : super(bundle) {
    imageSourceTarget = ImageSourceTarget(context);

    imageSourceRoute = ImageSourceRoute(appScope, imageSourceTarget);
    imagePickerRoute = ImagePickerRoute();
    imageCropperRoute = ImageCropperRoute();
    mainRoute = MainRoute(appScope, navigatorTarget);

    onBackReaction = SimpleOnBackReaction(trace);
    onChangeAvatarReaction = OnChangeAvatarReaction(model, imageSourceRoute, imagePickerRoute, imageCropperRoute);
    onNameChangedReaction = OnNameChangedReaction(model);
    onCreateProfileReaction = OnCreateProfileReaction(
        appScope.isNetworkAvailableFunc,
        appScope.createProfileTask,
        mainRoute,
        model
    );
  }
}
