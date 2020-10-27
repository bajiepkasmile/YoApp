import 'package:flutter_utils/architecture/presentation/reaction/simple_on_back_reaction.dart';
import 'package:flutter_utils/architecture/presentation/scope/scope_bundle.dart';
import 'package:flutter_utils/architecture/presentation/scope/widget_scope.dart';
import 'package:yo_app/models/contact.dart';
import 'package:yo_app/models/input_status.dart';
import 'package:yo_app/presentation/app/yo_app_scope.dart';
import 'package:yo_app/presentation/views/contact/contact_model.dart';
import 'package:yo_app/presentation/views/contact/reactions/on_hi_reaction.dart';
import 'package:yo_app/presentation/views/contact/reactions/on_like_reaction.dart';
import 'package:yo_app/presentation/views/contact/reactions/on_share_reaction.dart';

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
