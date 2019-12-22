import '../../../../../model/profile.dart';
import 'firestore_profile.dart';

class FirestoreProfileMapper {

  Profile toProfile(FirestoreProfile firestoreProfile) => Profile(
      firestoreProfile.id,
      firestoreProfile.phone,
      firestoreProfile.avatarUrl,
      firestoreProfile.fullName
  );

  FirestoreProfile toFirestoreProfile(Profile profile, String uid) => FirestoreProfile(
      profile.id,
      uid,
      profile.phone,
      profile.avatarUrl,
      profile.fullName
  );
}
