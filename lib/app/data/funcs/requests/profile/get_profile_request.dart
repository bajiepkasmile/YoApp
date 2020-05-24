import '../../../../../architecture/common/async_func.dart';
import '../../../../tools/firestore/firestore_entry.dart';
import '../../../../tools/firestore/profile/firestore_profile.dart';
import '../../../../tools/firestore/profile/firestore_profile_mapper.dart';
import '../../../../models/profile.dart';

class GetProfileRequest extends AsyncFunc<String, Profile> {

  final FirestoreEntry _firestoreEntry;
  final FirestoreProfileMapper _mapper;

  GetProfileRequest(this._firestoreEntry, this._mapper);

  @override
  Future<Profile> call(String uid) async {
    final firestoreProfiles = await _firestoreEntry.profiles.where(FirestoreProfile.UID_KEY, isEqualTo: uid).loadAll();

    if (firestoreProfiles.isEmpty) {
      return null;
    }

    final profile = firestoreProfiles.first;
//    return _mapper.toProfile(profile);
  }
}
