import '../../../../flutter_utils/architecture/presentation/scope/scope_bundle.dart';
import '../../../../flutter_utils/architecture/presentation/scope/widget_scope.dart';
import '../../app/yo_app_scope.dart';
import 'reactions/on_name_changed_reaction.dart';
import 'reactions/on_name_submitted_reaction.dart';
import 'profile_creator_model.dart';

class ProfileCreatorScope extends WidgetScope<YoAppScope, void, void, ProfileCreatorModel> {

  OnNameChangedReaction onNameChangedReaction;
  OnNameSubmittedReaction onNameSubmittedReaction;

  ProfileCreatorScope(ScopeBundle<YoAppScope, void, void, ProfileCreatorModel> bundle) : super(bundle) {
    onNameChangedReaction = OnNameChangedReaction(viewModel);
    onNameSubmittedReaction = OnNameSubmittedReaction(
        viewModel,
        appScope.logInInfoSetting,
        appScope.createSelfProfileTask
    );
  }
}
