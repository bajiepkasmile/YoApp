import 'dart:async';

import 'package:architecture/common/sync_func.dart';
import 'package:yo_app/presentation/views/sms_input/sms_input_model.dart';

class StartTimerFunc extends SyncFunc<void, void> {

  final SmsInputModel _model;

  StartTimerFunc(this._model);

  @override
  void call(void arg) {
    _model.secondsLeft = 60;
    Timer.periodic(Duration(seconds: 1), _onTimerTick);
  }

  void _onTimerTick(Timer timer) {
    _model.secondsLeft--;
    _model.refresh();
    if (_model.secondsLeft == 0) {
      timer.cancel();
    }
  }
}
