import 'package:architecture/common/async_func.dart';
import 'package:permission_handler/permission_handler.dart';

class RequestContactsPermissionFunc extends AsyncFunc<void, bool> {

  @override
  Future<bool> call(void arg) => Permission.contacts.request().isGranted;
}
