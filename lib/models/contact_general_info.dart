import 'profile_general_info.dart';

class ContactGeneralInfo extends ProfileGeneralInfo {

  final bool isInApp;

  ContactGeneralInfo(
      String id,
      String phone,
      String avatarName,
      String name,
      int likesCount,
      this.isInApp
  ) : super(id, phone, avatarName, name, likesCount);
}
