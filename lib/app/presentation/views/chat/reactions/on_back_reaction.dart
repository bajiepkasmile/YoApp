import '../../../../../architecture/presentation/navigation/route_trace.dart';
import '../../../../../architecture/presentation/reaction/reaction.dart';

class OnBackReaction extends Reaction<void> {

  final RouteTrace<void> _trace;

  OnBackReaction(this._trace);

  @override
  void excite(void arg) => _trace.comeBack(null);
}
