import 'package:architecture/common/async_func.dart';
import 'package:yo_app/models/contact_general_info.dart';
import 'package:yo_app/tools/firestore/firestore_entry.dart';
import 'package:yo_app/tools/firestore/profile/firestore_profile_mapper.dart';

class GetRemoteContactGeneralInfosFunc extends AsyncFunc<void, List<ContactGeneralInfo>> {

  final FirestoreEntry _firestoreEntry;
  final FirestoreProfileGeneralInfoMapper _mapper;

  GetRemoteContactGeneralInfosFunc(this._firestoreEntry, this._mapper);

  @override
  Future<List<ContactGeneralInfo>> call(void arg) async {
    final firestoreProfiles = await _firestoreEntry.profiles.loadAll();
    return firestoreProfiles
        .map(_mapper.toProfileGeneralInfo)
        .where((profile) => profile.id != profileId)
        .toList();
  }
}
