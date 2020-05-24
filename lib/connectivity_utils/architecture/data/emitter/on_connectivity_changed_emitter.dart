import 'package:connectivity/connectivity.dart';

import '../../../../architecture/data/emitter/emitter.dart';

class OnConnectivityChangedEmitter extends Emitter<bool> {

  OnConnectivityChangedEmitter(Connectivity connectivity) {
    connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.none) {
        emitEvent(false);
      } else {
        emitEvent(true);
      }
    });
  }
}
