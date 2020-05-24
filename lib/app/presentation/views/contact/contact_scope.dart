import '../../../../flutter_utils/architecture/presentation/reaction/simple_on_back_reaction.dart';
import '../../../../flutter_utils/architecture/presentation/scope/scope_bundle.dart';
import '../../../../flutter_utils/architecture/presentation/scope/widget_scope.dart';
import '../../../models/input_status.dart';
import '../../../models/contact.dart';
import '../../app/yo_app_scope.dart';
import 'reactions/on_hi_reaction.dart';
import 'reactions/on_like_reaction.dart';
import 'reactions/on_share_reaction.dart';
import 'contact_model.dart';

class ContactScope extends WidgetScope<YoAppScope, ContactModel, Contact, void> {

  OnShareReaction onShareReaction;
  OnHiReaction onHiReaction;
  OnLikeReaction onLikeReaction;
  SimpleOnBackReaction onBackReaction;

  ContactScope(ScopeBundle<YoAppScope, ContactModel, Contact, void> bundle) : super(bundle) {
    onShareReaction = OnShareReaction();
    onHiReaction = OnHiReaction();
    onLikeReaction = OnLikeReaction();
    onBackReaction = SimpleOnBackReaction(trace);
  }

  @override
  void onConfigure() {
    model.status = arg.canSendLike ? InputStatus.active : InputStatus.inactive;
  }
}
