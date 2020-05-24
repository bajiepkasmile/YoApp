import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';

import '../../../../architecture/data/task/task.dart';
import '../../../models/profile.dart';
import '../../funcs/requests/profile/create_profile_request.dart';
import '../../repositories/profile_box.dart';
import '../../settings/log_in_info_setting.dart';
import '../../settings/profile_setting.dart';

class CreateProfileTask extends Task<CreateProfileTaskArg, Profile> {

  final CreateProfileRequest _createProfileRequest;
  final LogInInfoSetting _logInInfoSetting;
  final ProfileSetting _profileSetting;
  final ProfileBox _profileRepository;

  CreateProfileTask(
      this._createProfileRequest,
      this._logInInfoSetting,
      this._profileSetting,
      this._profileRepository
  );

  @override
  Future<Profile> createTaskFuture(CreateProfileTaskArg arg) async {
    final logInInfo = await _logInInfoSetting.get();
    if (logInInfo == null) {
      throw AuthException("", "");
    }

    final profile = Profile("", logInInfo.phone, arg.avatarFile, arg.name, 0, [], []);
    final operationArg = CreateProfileRequestArg(logInInfo.uid, profile);
    final selfProfile = await _createProfileRequest.call(operationArg);
    await _profileSetting.set(selfProfile);
    _profileRepository.data = selfProfile;
    return selfProfile;
  }
}

class CreateProfileTaskArg {

  final File avatarFile;
  final String name;

  CreateProfileTaskArg(this.avatarFile, this.name);
}
