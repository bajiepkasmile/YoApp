import '../../../../../architecture/data/operation/operation.dart';
import '../../../../model/profile.dart';
import '../../../settings/uid_setting.dart';
import '../../tools/firestore/firestore_entry.dart';
import '../../tools/firestore/profile/firestore_profile.dart';
import '../../tools/firestore/profile/firestore_profile_mapper.dart';

class GetRemoteSelfProfileOperation extends Operation<void, Profile> {

  final FirestoreEntry _firestoreEntry;
  final UidSetting _uidSetting;
  final FirestoreProfileMapper _mapper;

  GetRemoteSelfProfileOperation(this._firestoreEntry, this._uidSetting, this._mapper);

  @override
  Future<Profile> execute(void arg) async {
    final uid = _uidSetting.get();
    final firestoreProfiles = await _firestoreEntry.profiles.where(FirestoreProfile.UID_KEY, uid);
    return _mapper.toProfile(firestoreProfiles.first);
  }
}
