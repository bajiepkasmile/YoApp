import '../../../../../architecture/data/operation/operation.dart';
import '../../../../model/profile.dart';
import '../../tools/firestore/firestore_entry.dart';
import '../../tools/firestore/profile/firestore_profile_mapper.dart';

class CreateProfileOperation extends Operation<CreateSelfProfileOperationArg, Profile> {

  final FirestoreEntry _firestoreEntry;
  final FirestoreProfileMapper _mapper;

  CreateProfileOperation(this._firestoreEntry, this._mapper);

  @override
  Future<Profile> execute(CreateSelfProfileOperationArg arg) async {
    final firestoreProfile = _mapper.toFirestoreProfile(arg.profile, arg.uid);
    final profile = await _firestoreEntry.profiles.add(firestoreProfile);
    return _mapper.toProfile(profile);
  }
}

class CreateSelfProfileOperationArg {

  final String uid;
  final Profile profile;

  CreateSelfProfileOperationArg(this.uid, this.profile);
}
