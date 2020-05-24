import 'package:flutter/widgets.dart';

import '../../../../flutter_utils/architecture/presentation/navigation/target_route.dart';
import '../../../../flutter_utils/architecture/presentation/navigation/targets/target.dart';
import '../../../../architecture/presentation/navigation/route_bundle.dart';
import '../../../models/contact.dart';
import '../../app/yo_app_scope.dart';
import 'contact_state.dart';

class ContactRoute extends TargetRoute<YoAppScope, Contact, void> {

  ContactRoute(YoAppScope appScope, Target target) : super(appScope, target);

  @override
  State<StatefulWidget> createState(RouteBundle<YoAppScope, Contact, void> bundle) => ContactState(bundle);
}
