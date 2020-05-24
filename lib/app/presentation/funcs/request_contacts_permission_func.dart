import 'package:permission_handler/permission_handler.dart';

import '../../../architecture/common/async_func.dart';

class RequestContactsPermissionFunc extends AsyncFunc<void, bool> {

  @override
  Future<bool> call(void arg) => Permission.contacts.request().isGranted;
}
