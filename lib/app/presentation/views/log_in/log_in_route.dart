import 'package:flutter/widgets.dart';

import '../../../../flutter_utils/architecture/presentation/navigation/widget_container.dart';
import '../../../../flutter_utils/architecture/presentation/navigation/widget_route.dart';
import '../../../../architecture/presentation/navigation/route_bundle.dart';
import '../../app/yo_app_scope.dart';
import 'log_in_widget.dart';

class LogInRoute extends WidgetRoute<YoAppScope, void, void> {

  LogInRoute(
      BuildContext context,
      YoAppScope appScope,
      WidgetContainer widgetContainer
  ) : super(context, appScope, widgetContainer);

  @override
  Widget createWidget(RouteBundle<YoAppScope, void, void> bundle) => LogInWidget(bundle);
}
