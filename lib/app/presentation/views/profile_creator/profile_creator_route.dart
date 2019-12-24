import 'package:flutter/widgets.dart';

import '../../../../architecture/presentation/navigation/route_bundle.dart';
import '../../../../flutter_utils/architecture/presentation/navigation/widget_container.dart';
import '../../../../flutter_utils/architecture/presentation/navigation/widget_route.dart';
import '../../app/yo_app_scope.dart';
import 'profile_creator_widget.dart';

class ProfileCreatorRoute extends WidgetRoute<YoAppScope, void, void> {

  ProfileCreatorRoute(
      BuildContext context,
      YoAppScope appScope,
      WidgetContainer widgetContainer
  ) : super(context, appScope, widgetContainer);

  @override
  Widget createWidget(RouteBundle<YoAppScope, void, void> bundle) => ProfileCreatorWidget(bundle);
}
