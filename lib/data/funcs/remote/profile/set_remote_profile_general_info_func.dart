import 'package:architecture/common/async_func.dart';
import 'package:yo_app/data/boxes/log_in_info_box.dart';
import 'package:yo_app/models/profile_general_info.dart';
import 'package:yo_app/tools/firestore/firestore_entry.dart';
import 'package:yo_app/tools/firestore/profile/firestore_profile_mapper.dart';

class SetRemoteProfileGeneralInfoFunc extends AsyncFunc<ProfileGeneralInfo, void> {

  final LogInInfoBox _logInInfoBox;
  final FirestoreEntry _firestoreEntry;
  final FirestoreProfileGeneralInfoMapper _mapper;

  SetRemoteProfileGeneralInfoFunc(this._logInInfoBox, this._firestoreEntry, this._mapper);

  @override
  Future<void> call(ProfileGeneralInfo profileGeneralInfo) async {
    final mappedProfile = _mapper.toFirestoreProfileGeneralInfo(profileGeneralInfo, _logInInfoBox.data.uid);
    final firestoreProfile = await _firestoreEntry.profiles.add(mappedProfile);
    return _mapper.toProfileGeneralInfo(firestoreProfile);
  }
}
