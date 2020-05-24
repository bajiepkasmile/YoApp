import '../../../../../architecture/common/async_func.dart';
import '../../../../tools/firestore/firestore_entry.dart';
import '../../../../tools/firestore/message/firestore_message.dart';
import '../../../../tools/firestore/message/firestore_message_mapper.dart';

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
