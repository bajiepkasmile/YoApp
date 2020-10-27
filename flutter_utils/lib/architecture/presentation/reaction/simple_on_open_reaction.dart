import 'package:architecture/presentation/navigation/route.dart';
import 'package:architecture/presentation/reaction/reaction.dart';

class SimpleOnOpenReaction<TArg> extends Reaction<TArg> {

  final Route<TArg, dynamic> _route;

  SimpleOnOpenReaction(this._route);

  @override
  void excite(TArg arg) => _route.add(arg);
}
