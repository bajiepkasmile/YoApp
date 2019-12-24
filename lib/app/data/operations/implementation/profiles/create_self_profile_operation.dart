import '../../../../../architecture/data/operation/operation.dart';
import '../../../../model/profile.dart';
import '../../../settings/log_in_info_setting.dart';
import '../../tools/firestore/firestore_entry.dart';
import '../../tools/firestore/profile/firestore_profile_mapper.dart';

class CreateSelfProfileOperation extends Operation<Profile, Profile> {

  final FirestoreEntry _firestoreEntry;
  final FirestoreProfileMapper _mapper;
  final LogInInfoSetting _logInInfoSetting;

  CreateSelfProfileOperation(this._firestoreEntry, this._mapper, this._logInInfoSetting);

  @override
  Future<Profile> execute(Profile profile) async {
    final logInInfo = await _logInInfoSetting.get();
    final mappedProfile = _mapper.toFirestoreProfile(profile, logInInfo.uid);
    final selfProfile = await _firestoreEntry.profiles.add(mappedProfile);
    return _mapper.toProfile(selfProfile);
  }
}
