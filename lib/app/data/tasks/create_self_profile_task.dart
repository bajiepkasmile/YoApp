import '../../../architecture/data/task/task.dart';
import '../../model/profile.dart';
import '../operations/implementation/profiles/create_self_profile_operation.dart';
import '../repositories/self_profile_repository.dart';
import '../settings/self_profile_setting.dart';

class CreateSelfProfileTask extends Task<CreateSelfProfileArg, Profile> {

  final CreateSelfProfileOperation _createSelfProfileOperation;
  final SelfProfileSetting _selfProfileSetting;
  final SelfProfileRepository _selfProfileRepository;

  CreateSelfProfileTask(this._createSelfProfileOperation, this._selfProfileSetting, this._selfProfileRepository);

  @override
  Future<Profile> createTaskFuture(CreateSelfProfileArg arg) async {
    final profile = Profile("", arg.phone, "", arg.name);
    final selfProfile = await _createSelfProfileOperation.execute(profile);
    await _selfProfileSetting.set(selfProfile);
    _selfProfileRepository.data = selfProfile;
    return selfProfile;
  }
}

class CreateSelfProfileArg {

  final String phone;
  final String name;

  CreateSelfProfileArg(this.phone, this.name);
}
