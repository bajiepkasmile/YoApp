import 'package:architecture/common/async_func.dart';
import 'package:yo_app/models/chat_with_profile_id.dart';
import 'package:yo_app/tools/floor/chat/floor_chat_mapper.dart';
import 'package:yo_app/tools/floor/chat/floor_chats_dao.dart';

class GetLocalChatWithProfileIdsFunc extends AsyncFunc<void, List<ChatWithProfileId>> {

  final FloorChatsDao _dao;
  final FloorChatMapper _mapper;

  GetLocalChatWithProfileIdsFunc(this._dao, this._mapper);

  @override
  Future<List<ChatWithProfileId>> call(void arg) async {
    final floorChats = await _dao.getAll();
    return floorChats.map(_mapper.toChatWithProfileId).toList();
  }
}
