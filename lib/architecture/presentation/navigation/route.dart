import 'route_trace.dart';

/// Абстракция для открытия новой вью.
abstract class Route<TArg, TResult> implements RouteTrace<TResult> {

  Future<TResult> follow(TArg arg);

  Future<TResult> followReplacement(TArg arg);
}
