import '../../../../../architecture/presentation/reaction/reaction.dart';
import '../../chat_list/chat_list_route.dart';
import '../../contact_list/contact_list_route.dart';
import '../../main/main_model.dart';
import '../../profile/profile_route.dart';
import '../models/main_tab_type.dart';

class OnSwitchTabReaction extends Reaction<MainTabType> {

  final MainModel _model;
  final ProfileRoute _profileRoute;
  final ChatListRoute _chatListRoute;
  final ContactListRoute _contactListRoute;

  OnSwitchTabReaction(this._model, this._profileRoute, this._chatListRoute, this._contactListRoute);

  @override
  void excite(MainTabType arg) {
    switch(arg) {
      case MainTabType.profile:
        _model.tabType = MainTabType.profile;
        _profileRoute.replace(null);
        break;
      case MainTabType.chatList:
        _model.tabType = MainTabType.chatList;
        _chatListRoute.replace(null);
        break;
      case MainTabType.contactList:
        _model.tabType = MainTabType.contactList;
        _contactListRoute.replace(null);
        break;
    }
    _model.refresh();
  }
}
