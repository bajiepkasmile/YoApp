import 'package:architecture/common/async_func.dart';
import 'package:connectivity/connectivity.dart';

class IsNetworkAvailableFunc extends AsyncFunc<void, bool> {

  final Connectivity _connectivity;

  IsNetworkAvailableFunc(this._connectivity);

  @override
  Future<bool> call(void arg) async {
    final result = await _connectivity.checkConnectivity();
    if (result == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }
}
