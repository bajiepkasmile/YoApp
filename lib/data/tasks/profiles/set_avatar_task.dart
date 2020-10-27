import 'dart:io';

import 'package:architecture/data/task/task.dart';
import 'package:yo_app/data/boxes/profile_box.dart';
import 'package:yo_app/data/funcs/local/profile/set_local_avatar_func.dart';
import 'package:yo_app/data/funcs/remote/profile/set_remote_avatar_func.dart';
import 'package:yo_app/data/settings/profile_general_info_setting.dart';
import 'package:yo_app/models/avatar.dart';
import 'package:yo_app/models/profile_general_info.dart';

class SetAvatarTask extends Task<File, void> {

  final SetRemoteAvatarFunc _setRemoteAvatarFunc;
  final SetLocalAvatarFunc _setLocalAvatarFunc;
  final ProfileBox _profileBox;
  final ProfileGeneralInfoSetting _profileGeneralInfoSetting;

  SetAvatarTask(this._setRemoteAvatarFunc, this._setLocalAvatarFunc, this._profileBox, this._profileGeneralInfoSetting);

  @override
  Future<void> createTaskFuture(File avatarFile) async {
    final avatarName = await _setRemoteAvatarFunc.call(avatarFile);
    final avatar = Avatar(avatarFile, avatarName);
    await _setLocalAvatarFunc.call(avatar);
    _profileBox.data = _profileBox.data.copy(avatar: avatar);
    await _profileGeneralInfoSetting.set(
        ProfileGeneralInfo(
            _profileBox.data.id,
            _profileBox.data.phone,
            _profileBox.data.avatar.name,
            _profileBox.data.name,
            _profileBox.data.likesCount
        )
    );
  }
}
