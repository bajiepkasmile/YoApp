import '../../../../architecture/data/task/task.dart';
import '../../../model/profile.dart';
import '../../operations/implementation/profiles/create_profile_operation.dart';
import '../../repositories/self_profile_repository.dart';
import '../../settings/log_in_info_setting.dart';
import '../../settings/self_profile_setting.dart';

class CreateSelfProfileTask extends Task<CreateSelfProfileTaskArg, Profile> {

  final CreateProfileOperation _createProfileOperation;
  final LogInInfoSetting _logInInfoSetting;
  final SelfProfileSetting _selfProfileSetting;
  final SelfProfileRepository _selfProfileRepository;

  CreateSelfProfileTask(
      this._createProfileOperation,
      this._logInInfoSetting,
      this._selfProfileSetting,
      this._selfProfileRepository
  );

  @override
  Future<Profile> createTaskFuture(CreateSelfProfileTaskArg arg) async {
    final logInInfo = await _logInInfoSetting.get();
    final profile = Profile("", arg.phone, "", arg.name);
    final operationArg = CreateSelfProfileOperationArg(logInInfo.uid, profile);
    final selfProfile = await _createProfileOperation.execute(operationArg);
    await _selfProfileSetting.set(selfProfile);
    _selfProfileRepository.data = selfProfile;
    return selfProfile;
  }
}

class CreateSelfProfileTaskArg {

  final String phone;
  final String name;

  CreateSelfProfileTaskArg(this.phone, this.name);
}
