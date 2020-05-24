import 'package:share/share.dart';

import '../../../../architecture/presentation/navigation/route.dart';

class ContactInvitationRoute extends Route<void, void> {

  @override
  Future<void> add(void arg) => Share.share("ссылки");
}
