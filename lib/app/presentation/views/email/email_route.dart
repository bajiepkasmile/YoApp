import 'package:url_launcher/url_launcher.dart';

import '../../../../architecture/presentation/navigation/route.dart';

class EmailRoute extends Route<void, void> {

  @override
  Future<void> add(void arg) => launch("mailto:some@gmail.com");
}
