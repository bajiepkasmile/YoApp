import 'package:architecture/common/async_func.dart';
import 'package:yo_app/models/chat.dart';

class GetRemoteChatsFunc extends AsyncFunc<void, List<Chat>> {

  @override
  Future<List<Chat>> call(void arg) {
  }
}

/*
//class GetMessagesRequest extends AsyncFunc<GetMessagesRequestArg, List<Message>> {
//
//  final FirestoreEntry _firestoreEntry;
//  final FirestoreMessageMapper _mapper;
//
//  GetMessagesRequest(this._firestoreEntry, this._mapper);
//
//  @override
//  Future<List<Message>> call(GetMessagesRequestArg arg) async {
//    final ids = [arg.senderProfileId, arg.receiverProfileId];
//    final firebaseMessages = await _firestoreEntry.messages
//        .where(FirestoreMessage.SENDER_PROFILE_ID_KEY, whereIn: ids)
//        .where(FirestoreMessage.RECEIVER_PROFILE_ID_KEY, whereIn: ids)
//        .loadAll()
//    ;
//    return firebaseMessages.map(_mapper.toMessage).toList();
//  }
//}
//
//class GetMessagesRequestArg {
//
//  final String senderProfileId;
//  final String receiverProfileId;
//
//  GetMessagesRequestArg(this.senderProfileId, this.receiverProfileId);
//}
 */