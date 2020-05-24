import '../../../../../architecture/common/async_func.dart';
import '../../../../tools/firestore/firestore_entry.dart';
import '../../../../tools/firestore/profile/firestore_profile_mapper.dart';
import '../../../../models/profile.dart';

class CreateProfileRequest extends AsyncFunc<CreateProfileRequestArg, Profile> {

  final FirestoreEntry _firestoreEntry;
  final FirestoreProfileMapper _mapper;

  CreateProfileRequest(this._firestoreEntry, this._mapper);

  @override
  Future<Profile> call(CreateProfileRequestArg arg) async {
//    final firestoreProfile = _mapper.toFirestoreProfile(arg.profile, arg.uid);
//    final profile = await _firestoreEntry.profiles.add(firestoreProfile);
//    return _mapper.toProfile(profile);
  }
}

class CreateProfileRequestArg {

  final String uid;
  final Profile profile;

  CreateProfileRequestArg(this.uid, this.profile);
}
