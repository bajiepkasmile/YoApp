import 'package:flutter/material.dart';

import '../../../architecture/presentation/view/view_model.dart';
import '../../../implemented_architecture/presentation/scope/scope_bundle.dart';
import '../../../implemented_architecture/presentation/view/app_widget.dart';
import 'yo_app_scope.dart';

class YoApp extends AppWidget<YoAppScope> {

  @override
  YoAppScope createScope(ScopeBundle<YoAppScope, void, void, ViewModel> bundle) => YoAppScope(bundle);

  @override
  void onInit() => scope.onInitReaction.excite(null);

  @override
  Widget build() =>
      MaterialApp(
        title: "Yo!",
        home: scope.screenContainer.widget,
        theme: ThemeData(
            primaryColor: Colors.grey,
            accentColor: Colors.grey,
            textSelectionColor: Colors.black26,
            textSelectionHandleColor: Colors.grey,
            cursorColor: Colors.grey
        ),
      );
}
