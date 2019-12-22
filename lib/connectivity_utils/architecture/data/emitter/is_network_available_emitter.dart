import 'package:connectivity/connectivity.dart';

import '../../../../architecture/data/emitter/emitter.dart';

class IsNetworkAvailableEmitter extends Emitter<bool> {

  IsNetworkAvailableEmitter(Connectivity connectivity) {
    connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.none) {
        emitEvent(false);
      } else {
        emitEvent(true);
      }
    });
  }
}
