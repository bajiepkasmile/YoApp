import 'package:architecture/common/async_func.dart';
import 'package:yo_app/data/boxes/log_in_info_box.dart';
import 'package:yo_app/models/profile_general_info.dart';
import 'package:yo_app/tools/firestore/firestore_entry.dart';
import 'package:yo_app/tools/firestore/profile/firestore_profile.dart';
import 'package:yo_app/tools/firestore/profile/firestore_profile_mapper.dart';

class GetRemoteProfileGeneralInfoFunc extends AsyncFunc<void, ProfileGeneralInfo> {

  final LogInInfoBox _logInInfoBox;
  final FirestoreEntry _firestoreEntry;
  final FirestoreProfileGeneralInfoMapper _mapper;

  GetRemoteProfileGeneralInfoFunc(this._logInInfoBox, this._firestoreEntry, this._mapper);

  @override
  Future<ProfileGeneralInfo> call(void arg) async {
    final firestoreProfileGeneralInfos = await _firestoreEntry.profiles
        .where(FirestoreProfile.UID_KEY, isEqualTo: _logInInfoBox.data.uid)
        .loadAll();

    if (firestoreProfileGeneralInfos.isEmpty) {
      return null;
    } else {
      return _mapper.toProfileGeneralInfo(firestoreProfileGeneralInfos.first);
    }
  }
}
