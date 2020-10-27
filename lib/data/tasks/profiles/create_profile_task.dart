import 'package:architecture/data/task/task.dart';
import 'package:yo_app/data/boxes/is_profile_updated_box.dart';
import 'package:yo_app/data/boxes/profile_box.dart';
import 'package:yo_app/data/funcs/local/profile/set_local_profile_func.dart';
import 'package:yo_app/data/funcs/remote/profile/create_remote_profile_func.dart';
import 'package:yo_app/models/profile.dart';

class CreateProfileTask extends Task<CreateRemoteProfileFuncArg, Profile> {

  final CreateRemoteProfileFunc _createRemoteProfileFunc;
  final SetLocalProfileFunc _setLocalProfileFunc;
  final ProfileBox _profileBox;
  final IsProfileUpdatedBox _isProfileUpdatedBox;

  CreateProfileTask(
      this._createRemoteProfileFunc,
      this._setLocalProfileFunc,
      this._profileBox,
      this._isProfileUpdatedBox
  );

  @override
  Future<Profile> createTaskFuture(CreateRemoteProfileFuncArg arg) async {
    final profile = await _createRemoteProfileFunc.call(arg);
    await _setLocalProfileFunc.call(profile);
    _profileBox.data = profile;
    _isProfileUpdatedBox.data = true;
    return profile;
  }
}
