import 'package:flutter_utils/architecture/presentation/reaction/simple_on_open_reaction.dart';
import 'package:flutter_utils/architecture/presentation/scope/scope_bundle.dart';
import 'package:flutter_utils/architecture/presentation/scope/widget_scope.dart';
import 'package:yo_app/models/contact.dart';
import 'package:yo_app/presentation/app/yo_app_scope.dart';
import 'package:yo_app/presentation/funcs/request_contacts_permission_func.dart';
import 'package:yo_app/presentation/views/contact/contact_route.dart';
import 'package:yo_app/presentation/views/contact_invitation/contact_invitation_route.dart';
import 'package:yo_app/presentation/views/contact_list/contact_list_model.dart';
import 'package:yo_app/presentation/views/contact_list/reactions/on_add_contacts_reaction.dart';
import 'package:yo_app/presentation/views/new_contact/new_contact_route.dart';

class ContactListScope extends WidgetScope<YoAppScope, ContactListModel, void, void> {

  ContactRoute contactRoute;
  NewContactRoute newContactRoute;
  ContactInvitationRoute contactInvitationRoute;

  RequestContactsPermissionFunc requestContactsPermissionFunc;

  OnAddContactsReaction onAddContactsReaction;
  SimpleOnOpenReaction<Contact> onOpenContactReaction;
  SimpleOnOpenReaction onOpenAddContactReaction;
  SimpleOnOpenReaction onInviteContactReaction;

  ContactListScope(ScopeBundle<YoAppScope, ContactListModel, void, void> bundle) : super(bundle) {
    contactRoute = ContactRoute(appScope, navigatorTarget);
    newContactRoute = NewContactRoute(appScope, navigatorTarget);
    contactInvitationRoute = ContactInvitationRoute();

    requestContactsPermissionFunc = RequestContactsPermissionFunc();

    onAddContactsReaction = OnAddContactsReaction(requestContactsPermissionFunc, appScope.getPhoneContactsWithChatsTask, model);
    onOpenContactReaction = SimpleOnOpenReaction(contactRoute);
    onOpenAddContactReaction = SimpleOnOpenReaction(newContactRoute);
    onInviteContactReaction = SimpleOnOpenReaction(contactInvitationRoute);
  }

  @override
  void onConfigure() {
    model.contacts = appScope.contactsBox.data;
  }
}
