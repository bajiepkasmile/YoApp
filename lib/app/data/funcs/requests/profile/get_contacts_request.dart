import '../../../../../architecture/common/async_func.dart';
import '../../../../tools/firestore/firestore_entry.dart';
import '../../../../tools/firestore/profile/firestore_profile_mapper.dart';
import '../../../../models/profile.dart';

class GetContactsRequest extends AsyncFunc<String, List<Profile>> {

  final FirestoreEntry _firestoreEntry;
  final FirestoreProfileMapper _mapper;

  GetContactsRequest(this._firestoreEntry, this._mapper);

  @override
  Future<List<Profile>> call(String profileId) async {
//    final firestoreProfiles = await _firestoreEntry.profiles.loadAll();
//    return firestoreProfiles
//        .map(_mapper.toProfile)
//        .where((profile) => profile.id != profileId)
//        .toList();
  }
}
