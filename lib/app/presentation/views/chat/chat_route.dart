import 'package:flutter/widgets.dart';

import '../../../../architecture/presentation/navigation/route_bundle.dart';
import '../../../../implemented_architecture/presentation/navigation/widget_route.dart';
import '../../../../implemented_architecture/presentation/navigation/widget_container.dart';
import '../../../model/profile.dart';
import '../../app/yo_app_scope.dart';
import 'chat_widget.dart';

class ChatRoute extends WidgetRoute<YoAppScope, Profile, void> {

  ChatRoute(
      BuildContext context,
      YoAppScope appScope,
      WidgetContainer widgetContainer
  ) : super(context, appScope, widgetContainer);

  @override
  Widget createWidget(RouteBundle<YoAppScope, Profile, void> bundle) => ChatWidget(bundle);
}
