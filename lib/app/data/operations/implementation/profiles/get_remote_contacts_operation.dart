import '../../../../../architecture/data/operation/operation.dart';
import '../../../../model/profile.dart';
import '../../tools/firestore/firestore_entry.dart';
import '../../tools/firestore/profile/firestore_profile_mapper.dart';

class GetRemoteContactsOperation extends Operation<String, List<Profile>> {

  final FirestoreEntry _firestoreEntry;
  final FirestoreProfileMapper _mapper;

  GetRemoteContactsOperation(this._firestoreEntry, this._mapper);

  @override
  Future<List<Profile>> execute(String profileId) async {
    final firestoreProfiles = await _firestoreEntry.profiles.loadAll();
    return firestoreProfiles
        .map(_mapper.toProfile)
        .where((profile) => profile.id != profileId)
        .toList();
  }
}
