import '../../../../flutter_utils/architecture/presentation/reaction/simple_on_open_reaction.dart';
import '../../../../flutter_utils/architecture/presentation/scope/scope_bundle.dart';
import '../../../../flutter_utils/architecture/presentation/scope/widget_scope.dart';
import '../../../models/contact.dart';
import '../../funcs/request_contacts_permission_func.dart';
import '../../app/yo_app_scope.dart';
import '../contact_invitation/contact_invitation_route.dart';
import '../contact/contact_route.dart';
import '../new_contact/new_contact_route.dart';
import 'reactions/on_add_contacts_reaction.dart';
import 'contact_list_model.dart';

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
    model.contacts = appScope.contactsRepository.data;
  }
}
