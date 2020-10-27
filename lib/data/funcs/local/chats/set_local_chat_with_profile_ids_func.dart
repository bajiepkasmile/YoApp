import 'package:architecture/common/async_func.dart';
import 'package:yo_app/models/chat_with_profile_id.dart';
import 'package:yo_app/tools/floor/chat/floor_chat_mapper.dart';
import 'package:yo_app/tools/floor/chat/floor_chats_dao.dart';

class SetLocalChatWithProfileIdsFunc extends AsyncFunc<List<ChatWithProfileId>, void> {

  final FloorChatsDao _dao;
  final FloorChatMapper _mapper;

  SetLocalChatWithProfileIdsFunc(this._dao, this._mapper);

  @override
  Future<void> call(List<ChatWithProfileId> chats) async {
    final floorChats = chats.map(_mapper.fromChatWithProfileId).toList();
    await _dao.replaceAll(floorChats);
  }
}
