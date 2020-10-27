import 'package:architecture/presentation/reaction/reaction.dart';
import 'package:yo_app/data/tasks/auth/log_out_task.dart';
import 'package:yo_app/presentation/views/phone_input/phone_input_route.dart';

class OnLogOutReaction extends Reaction<void> {

  final LogOutTask _logOutTask;
  final PhoneInputRoute _phoneInputRoute;

  OnLogOutReaction(this._logOutTask, this._phoneInputRoute);

  @override
  void excite(void arg) async {
    await _logOutTask.execute(null);
    _phoneInputRoute.replace(null);
  }
}
