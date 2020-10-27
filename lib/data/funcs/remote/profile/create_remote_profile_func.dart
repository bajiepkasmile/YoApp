import 'dart:io';

import 'package:architecture/common/async_func.dart';
import 'package:yo_app/data/boxes/log_in_info_box.dart';
import 'package:yo_app/data/funcs/remote/profile/set_remote_avatar_func.dart';
import 'package:yo_app/data/funcs/remote/profile/set_remote_profile_general_info_func.dart';
import 'package:yo_app/models/profile.dart';
import 'package:yo_app/models/profile_general_info.dart';

class CreateRemoteProfileFunc extends AsyncFunc<CreateRemoteProfileFuncArg, Profile> {

  final LogInInfoBox _logInInfoBox;
  final SetRemoteAvatarFunc _setRemoteAvatarFunc;
  final SetRemoteProfileGeneralInfoFunc _setRemoteProfileGeneralInfoFunc;

  CreateRemoteProfileFunc(this._logInInfoBox, this._setRemoteAvatarFunc, this._setRemoteProfileGeneralInfoFunc);

  @override
  Future<Profile> call(CreateRemoteProfileFuncArg arg) async {
    final  avatarName = arg.avatarFile != null
        ? await _setRemoteAvatarFunc.call(arg.avatarFile)
        : null;
    final profileGeneralInfo = ProfileGeneralInfo(null, _logInInfoBox.data.phone, avatarName, arg.profileName, 0);
    await _setRemoteProfileGeneralInfoFunc.call(profileGeneralInfo);
  }
}

class CreateRemoteProfileFuncArg {

  final File avatarFile;
  final String profileName;

  CreateRemoteProfileFuncArg(this.avatarFile, this.profileName);
}
