import '../../../../../architecture/data/operation/operation.dart';
import '../../../../model/profile.dart';
import '../../../settings/log_in_info_setting.dart';
import '../../tools/firestore/firestore_entry.dart';
import '../../tools/firestore/profile/firestore_profile.dart';
import '../../tools/firestore/profile/firestore_profile_mapper.dart';

class GetRemoteSelfProfileOperation extends Operation<void, Profile> {

  final FirestoreEntry _firestoreEntry;
  final LogInInfoSetting _logInInfoSetting;
  final FirestoreProfileMapper _mapper;

  GetRemoteSelfProfileOperation(this._firestoreEntry, this._logInInfoSetting, this._mapper);

  @override
  Future<Profile> execute(void arg) async {
    final logInInfo = await _logInInfoSetting.get();
    final firestoreProfiles = await _firestoreEntry.profiles.where(FirestoreProfile.UID_KEY, logInInfo.uid);

    if (firestoreProfiles.isEmpty) {
      return null;
    }

    final selfProfile = firestoreProfiles.first;
    return _mapper.toProfile(selfProfile);
  }
}
