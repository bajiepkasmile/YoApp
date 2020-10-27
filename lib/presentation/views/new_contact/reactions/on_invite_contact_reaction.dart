import 'package:architecture/presentation/navigation/route_trace.dart';
import 'package:architecture/presentation/reaction/reaction.dart';
import 'package:yo_app/presentation/views/contact_invitation/contact_invitation_route.dart';

class OnInviteContactReaction extends Reaction<void> {

  final ContactInvitationRoute _contactInvitationRoute;
  final RouteTrace<void> _trace;

  OnInviteContactReaction(this._contactInvitationRoute, this._trace);

  @override
  void excite(void arg) async {
    await _contactInvitationRoute.add(null);
    _trace.pop(null);
  }
}
