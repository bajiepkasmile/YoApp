import 'package:connectivity/connectivity.dart';

import '../../../../architecture/data/box/async_box.dart';

class IsNetworkAvailableBox extends AsyncBox<bool> {

  final Connectivity _connectivity;

  IsNetworkAvailableBox(this._connectivity);

  @override
  Future<bool> get() async {
    final result = await _connectivity.checkConnectivity();
    if (result == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }
}
