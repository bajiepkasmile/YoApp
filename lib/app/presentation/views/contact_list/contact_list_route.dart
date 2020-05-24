import 'package:flutter/widgets.dart';

import '../../../../flutter_utils/architecture/presentation/navigation/target_route.dart';
import '../../../../flutter_utils/architecture/presentation/navigation/targets/target.dart';
import '../../../../architecture/presentation/navigation/route_bundle.dart';
import '../../app/yo_app_scope.dart';
import 'contact_list_state.dart';

class ContactListRoute extends TargetRoute<YoAppScope, void, void> {

  ContactListRoute(YoAppScope appScope, Target target) : super(appScope, target);

  @override
  State<StatefulWidget> createState(RouteBundle<YoAppScope, void, void> bundle) => ContactListState(bundle);
}
