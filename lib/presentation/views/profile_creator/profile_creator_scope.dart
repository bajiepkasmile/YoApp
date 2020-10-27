import 'package:flutter_utils/architecture/presentation/reaction/simple_on_back_reaction.dart';
import 'package:flutter_utils/architecture/presentation/scope/scope_bundle.dart';
import 'package:flutter_utils/architecture/presentation/scope/widget_scope.dart';
import 'package:yo_app/presentation/app/yo_app_scope.dart';
import 'package:yo_app/presentation/views/image_cropper/image_cropper_route.dart';
import 'package:yo_app/presentation/views/image_picker/image_picker_route.dart';
import 'package:yo_app/presentation/views/image_source/image_source_route.dart';
import 'package:yo_app/presentation/views/image_source/image_source_target.dart';
import 'package:yo_app/presentation/views/main/main_route.dart';
import 'package:yo_app/presentation/views/profile/reactions/on_change_avatar_reaction.dart';
import 'package:yo_app/presentation/views/profile_creator/profile_creator_model.dart';
import 'package:yo_app/presentation/views/profile_creator/reactions/on_create_profile_reaction.dart';
import 'package:yo_app/presentation/views/profile_creator/reactions/on_name_changed_reaction.dart';

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
