import 'package:architecture/presentation/navigation/route_bundle.dart';
import 'package:architecture/presentation/view/view_model.dart';
import 'package:flutter_utils/architecture/presentation/scope/app_scope.dart';
import 'package:flutter_utils/architecture/presentation/view/widget_model.dart';
import 'package:flutter_utils/architecture/presentation/view/widget_model_bundle.dart';
import 'package:flutter_utils/architecture/presentation/view/widget_state.dart';

abstract class AppState<TAppScope extends AppScope<TAppScope>>
    extends WidgetState<TAppScope, TAppScope, ViewModel, void, void> {

  AppState() : super(RouteBundle(null, null, null));

  @override
  ViewModel createViewModel(WidgetModelBundle<void> bundle) => WidgetModel(bundle);
}
