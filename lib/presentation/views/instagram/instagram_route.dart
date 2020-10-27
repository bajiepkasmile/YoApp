import 'package:architecture/presentation/navigation/route.dart';
import 'package:url_launcher/url_launcher.dart';

class InstagramRoute extends Route<void, void> {

  @override
  Future<void> add(void arg) => launch("https://www.instagram.com");
}
