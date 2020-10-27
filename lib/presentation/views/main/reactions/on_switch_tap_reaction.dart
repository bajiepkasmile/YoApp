import 'package:architecture/presentation/reaction/reaction.dart';
import 'package:yo_app/presentation/views/chat_list/chat_list_route.dart';
import 'package:yo_app/presentation/views/contact_list/contact_list_route.dart';
import 'package:yo_app/presentation/views/main/main_model.dart';
import 'package:yo_app/presentation/views/main/models/main_tab_type.dart';
import 'package:yo_app/presentation/views/profile/profile_route.dart';

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
