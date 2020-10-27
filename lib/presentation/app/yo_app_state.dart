import 'package:architecture/presentation/view/view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_utils/architecture/presentation/navigation/targets/queue/queue_target_widget.dart';
import 'package:flutter_utils/architecture/presentation/scope/scope_bundle.dart';
import 'package:flutter_utils/architecture/presentation/view/app_widget.dart';
import 'package:yo_app/presentation/app/yo_app_scope.dart';
import 'package:yo_app/presentation/resources/app_colors.dart';

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
