import 'package:yo_app/models/contact_general_info.dart';
import 'package:yo_app/tools/floor/contact/floor_contact_general_info.dart';

class FloorContactGeneralInfoMapper {

  FloorGeneralInfoContact fromContactGeneralInfo(ContactGeneralInfo contact) =>
      FloorGeneralInfoContact(
          contact.id,
          contact.phone,
          contact.avatarName,
          contact.name,
          contact.likesCount,
          contact.isInApp
      );

  ContactGeneralInfo toContactGeneralInfo(FloorGeneralInfoContact floorContactGeneralInfo) =>
      ContactGeneralInfo(
          floorContactGeneralInfo.id,
          floorContactGeneralInfo.phone,
          floorContactGeneralInfo.avatarName,
          floorContactGeneralInfo.name,
          floorContactGeneralInfo.likesCount,
          floorContactGeneralInfo.isInApp
      );
}
