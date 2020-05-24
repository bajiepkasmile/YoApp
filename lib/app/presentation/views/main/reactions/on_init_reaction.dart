import '../../../../../architecture/presentation/reaction/reaction.dart';
import '../../contact_list/contact_list_route.dart';

class OnInitReaction extends Reaction<void> {

  final ContactListRoute _contactListRoute;

  OnInitReaction(this._contactListRoute);

  @override
  void excite(void arg) {
    _contactListRoute.replace(arg);
  }
}
