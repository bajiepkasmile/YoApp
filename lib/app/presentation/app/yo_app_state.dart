import 'package:flutter/material.dart';

import '../../../flutter_utils/architecture/presentation/navigation/targets/queue/queue_target_widget.dart';
import '../../../flutter_utils/architecture/presentation/scope/scope_bundle.dart';
import '../../../flutter_utils/architecture/presentation/view/app_widget.dart';
import '../../../architecture/presentation/view/view_model.dart';
import '../resources/app_colors.dart';
import 'yo_app_scope.dart';

class YoAppState extends AppState<YoAppScope> {

  @override
  YoAppScope createScope(ScopeBundle<YoAppScope, ViewModel, void, void> bundle) => YoAppScope(bundle);

  @override
  void initState() {
    super.initState();
    scope.onInitReaction.excite(null);
  }

  @override
  Widget build(BuildContext context) =>
      MaterialApp(
          title: "Yo!",
          home: QueueTargetWidget(scope.queueTarget),
          theme: ThemeData(
              backgroundColor: Colors.white,
              primaryColor: AppColors.purple,
              accentColor: AppColors.purple,
              errorColor: AppColors.red,
              textSelectionColor: Colors.black26,
              textSelectionHandleColor: Colors.grey,
              cursorColor: AppColors.purple,
              textTheme: TextTheme() //TODO: title - appbars | body1 - def | body 2 - emp
          ),
      );
}
