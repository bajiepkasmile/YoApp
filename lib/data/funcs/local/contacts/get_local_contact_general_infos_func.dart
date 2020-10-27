import 'package:architecture/common/async_func.dart';
import 'package:yo_app/models/contact_general_info.dart';
import 'package:yo_app/tools/floor/contact/floor_contact_general_info_mapper.dart';
import 'package:yo_app/tools/floor/contact/floor_contact_general_infos_dao.dart';

class GetLocalContactGeneralInfosFunc extends AsyncFunc<void, List<ContactGeneralInfo>> {

  final FloorContactGeneralInfosDao _dao;
  final FloorContactGeneralInfoMapper _mapper;

  GetLocalContactGeneralInfosFunc(this._dao, this._mapper);

  @override
  Future<List<ContactGeneralInfo>> call(void arg) async {
    final floorContacts = await _dao.getAll();
    return floorContacts.map(_mapper.toContactGeneralInfo).toList();
  }
}
