import 'package:architecture/common/async_func.dart';
import 'package:yo_app/models/contact_general_info.dart';
import 'package:yo_app/tools/floor/contact/floor_contact_general_info_mapper.dart';
import 'package:yo_app/tools/floor/contact/floor_contact_general_infos_dao.dart';

class SetLocalContactGeneralInfosFunc extends AsyncFunc<List<ContactGeneralInfo>, void> {

  final FloorContactGeneralInfosDao _dao;
  final FloorContactGeneralInfoMapper _mapper;

  SetLocalContactGeneralInfosFunc(this._dao, this._mapper);

  @override
  Future<void> call(List<ContactGeneralInfo> contactGeneralInfos) async {
    final floorContacts = contactGeneralInfos.map(_mapper.fromContactGeneralInfo).toList();
    await _dao.replaceAll(floorContacts);
  }
}
