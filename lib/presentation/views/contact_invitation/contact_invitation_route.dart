import 'package:architecture/presentation/navigation/route.dart';
import 'package:share/share.dart';

class ContactInvitationRoute extends Route<void, void> {

  @override
  Future<void> add(void arg) => Share.share("ссылки");
}
