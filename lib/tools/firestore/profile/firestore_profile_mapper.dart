import 'package:yo_app/models/profile_general_info.dart';
import 'package:yo_app/tools/firestore/profile/firestore_profile.dart';

class FirestoreProfileGeneralInfoMapper {

  ProfileGeneralInfo toProfileGeneralInfo(FirestoreProfile firestoreProfile) =>
      ProfileGeneralInfo(
        firestoreProfile.id,
        firestoreProfile.phone,
        firestoreProfile.avatarName,
        firestoreProfile.name,
        firestoreProfile.likesCount
      );

  FirestoreProfile fromProfileGeneralInfo(
      ProfileGeneralInfo profileGeneralInfo,
      String uid
  ) =>
      FirestoreProfile(
          profileGeneralInfo.id,
          uid,
          profileGeneralInfo.phone,
          profileGeneralInfo.avatarName,
          profileGeneralInfo.name,
          profileGeneralInfo.likesCount
      );
}
