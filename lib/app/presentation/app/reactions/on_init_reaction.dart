import 'package:yo_app/app/models/chat.dart';
import 'package:yo_app/app/models/contact.dart';
import 'package:yo_app/app/presentation/views/chat_list/chat_list_route.dart';
import 'package:yo_app/app/presentation/views/contact/contact_route.dart';

import '../../../../architecture/presentation/reaction/reaction.dart';
import '../../views/splash/splash_route.dart';

class OnInitReaction extends Reaction<void> {

//  final SplashRoute _splashRoute;
  final ContactRoute _splashRoute;

  OnInitReaction(this._splashRoute);

  @override
  void excite(void arg) async {
    _splashRoute.add(Contact("", "", null, "Harold", 143563, [], Chat(null, null, false, 0, 0, false, null), true));
  }
}
