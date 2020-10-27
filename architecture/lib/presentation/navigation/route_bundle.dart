import '../scope/scope.dart';
import 'route_trace.dart';

/// Структура с необходимыми зависимостями для открытия новой вью.
/// Предназначена для более удобной передачи зависимостей на новый экран. А также для избежания переписывания
/// кода при изменении передаваемых зависимостей.
class RouteBundle<TAppScope extends Scope, TArg, TResult> {

  final TAppScope appScope;
  final TArg arg;
  final RouteTrace<TResult> trace;

  RouteBundle(
      this.appScope,
      this.arg,
      this.trace
  );
}
