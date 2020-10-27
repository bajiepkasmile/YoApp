import 'route_trace.dart';

/// Абстракция для открытия новой вью.
class Route<TArg, TResult> extends RouteTrace<TResult> {

  Future<TResult> add(TArg arg) => throw UnsupportedError("");

  Future<TResult> replace(TArg arg)  => throw UnsupportedError("");
}
