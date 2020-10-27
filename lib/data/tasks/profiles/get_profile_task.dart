import 'package:architecture/data/task/task.dart';
import 'package:yo_app/data/boxes/is_profile_updated_box.dart';
import 'package:yo_app/data/boxes/profile_box.dart';
import 'package:yo_app/data/funcs/local/profile/get_local_profile_func.dart';
import 'package:yo_app/data/funcs/local/profile/set_local_profile_func.dart';
import 'package:yo_app/data/funcs/remote/profile/get_remote_profile_func.dart';
import 'package:yo_app/models/profile.dart';

class GetProfileTask extends Task<void, Profile> {

  final GetRemoteProfileFunc _getRemoteProfileFunc;
  final GetLocalProfileFunc _getLocalProfileFunc;
  final SetLocalProfileFunc _setLocalProfileFunc;
  final ProfileBox _profileBox;
  final IsProfileUpdatedBox _isProfileUpdatedBox;

  GetProfileTask(
      this._getRemoteProfileFunc,
      this._getLocalProfileFunc,
      this._setLocalProfileFunc,
      this._profileBox,
      this._isProfileUpdatedBox
  );

  @override
  Future<Profile> createTaskFuture(void arg) async {
    final remoteProfile = await _getRemoteProfileFunc.call(null);
    if (remoteProfile != null) {
      _setLocalProfileFunc.call(remoteProfile);
      _isProfileUpdatedBox.data = true;
      _profileBox.data = remoteProfile;
      return remoteProfile;
    }

    final localProfile = await _getLocalProfileFunc.call(null);
    if (localProfile != null) {
      _isProfileUpdatedBox.data = false;
      _profileBox.data = localProfile;
      return localProfile;
    }

    return null;
  }
}
