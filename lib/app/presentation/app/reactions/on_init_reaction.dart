import '../../../../architecture/presentation/reaction/reaction.dart';
import '../../views/log_in/log_in_route.dart';

class OnInitReaction extends Reaction<void> {

  final LogInRoute _logInRoute;

  OnInitReaction(this._logInRoute);

  @override
  void excite(void arg) => _logInRoute.follow(null);
}
