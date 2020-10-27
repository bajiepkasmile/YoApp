import 'package:flutter_utils/architecture/presentation/reaction/simple_on_back_reaction.dart';
import 'package:flutter_utils/architecture/presentation/scope/scope_bundle.dart';
import 'package:flutter_utils/architecture/presentation/scope/widget_scope.dart';
import 'package:yo_app/presentation/app/yo_app_scope.dart';
import 'package:yo_app/presentation/views/contact_invitation/contact_invitation_route.dart';
import 'package:yo_app/presentation/views/new_contact/new_contact_model.dart';
import 'package:yo_app/presentation/views/new_contact/reactions/on_add_contact_reaction.dart';
import 'package:yo_app/presentation/views/new_contact/reactions/on_invite_contact_reaction.dart';
import 'package:yo_app/presentation/views/new_contact/reactions/on_phone_changed_reaction.dart';

class NewContactScope extends WidgetScope<YoAppScope, NewContactModel, void, void> {

  ContactInvitationRoute contactInvitationRoute;

  SimpleOnBackReaction onBackReaction;
  OnPhoneChangedReaction onPhoneChangedReaction;
  OnAddContactReaction onAddContactReaction;
  OnInviteContactReaction onInviteContactReaction;

  NewContactScope(ScopeBundle<YoAppScope, NewContactModel, void, void> bundle) : super(bundle) {
    contactInvitationRoute = ContactInvitationRoute();

    onBackReaction = SimpleOnBackReaction(trace);
    onPhoneChangedReaction = OnPhoneChangedReaction(model, appScope.phoneFormatter);
    onAddContactReaction = OnAddContactReaction(appScope.isNetworkAvailableFunc, appScope.addContactTask, trace, model);
    onInviteContactReaction = OnInviteContactReaction(contactInvitationRoute, trace);
  }
}
