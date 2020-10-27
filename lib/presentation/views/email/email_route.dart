import 'package:architecture/presentation/navigation/route.dart';
import 'package:url_launcher/url_launcher.dart';

class EmailRoute extends Route<void, void> {

  @override
  Future<void> add(void arg) => launch("mailto:some@gmail.com");
}
