import '../../../../architecture/presentation/reaction/reaction.dart';
import '../../../../architecture/presentation/navigation/route.dart';

class SimpleOnOpenReaction<TArg> extends Reaction<TArg> {

  final Route<TArg, dynamic> _route;

  SimpleOnOpenReaction(this._route);

  @override
  void excite(TArg arg) => _route.add(arg);
}
