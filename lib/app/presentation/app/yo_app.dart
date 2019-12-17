import 'package:flutter/material.dart';

import '../../../architecture/presentation/view/view_model.dart';
import '../../../implemented_architecture/presentation/scope/scope_bundle.dart';
import '../../../implemented_architecture/presentation/view/app_widget.dart';
import 'yo_app_scope.dart';

class YoApp extends AppWidget<YoAppScope> {

  @override
  YoAppScope createScope(ScopeBundle<YoAppScope, void, void, ViewModel> bundle) => YoAppScope(bundle);

  @override
  Widget build() =>
      MaterialApp(
        title: "Yo!",
        home: scope.screenContainer.widget,
      );
}
