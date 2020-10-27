import 'package:architecture/presentation/navigation/route_trace.dart';
import 'package:architecture/presentation/reaction/reaction.dart';

class SimpleOnBackReaction<TResult> extends Reaction<TResult> {

  final RouteTrace<void> _trace;

  SimpleOnBackReaction(this._trace);

  @override
  void excite(TResult arg) => _trace.pop(arg);
}
