import 'package:architecture/presentation/reaction/reaction.dart';
import 'package:yo_app/presentation/views/sms_input/reactions/funcs/start_timer_func.dart';

class OnInitReaction extends Reaction<void> {

  final StartTimerFunc _startTimerFunc;

  OnInitReaction(this._startTimerFunc);

  @override
  void excite(void arg) {
    _startTimerFunc.call(null);
  }
}
