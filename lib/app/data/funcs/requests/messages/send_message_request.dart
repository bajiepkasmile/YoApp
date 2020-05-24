import '../../../../../architecture/common/async_func.dart';
import '../../../../tools/firestore/firestore_entry.dart';
import '../../../../tools/firestore/message/firestore_message.dart';
import '../../../../tools/firestore/message/firestore_message_mapper.dart';

//class SendMessageRequest extends AsyncFunc<SendMessageRequestArg, Message> {
//
//  final FirestoreEntry _firestoreEntry;
//  final FirestoreMessageMapper _mapper;
//
//  SendMessageRequest(this._firestoreEntry, this._mapper);
//
//  @override
//  Future<Message> call(SendMessageRequestArg arg) async {
//    final sendingFirestoreMessage = FirestoreMessage(null, arg.senderProfileId, arg.receiverProfileId);
//    final createdFirestoreMessage = await _firestoreEntry.messages.add(sendingFirestoreMessage);
//    return _mapper.toMessage(createdFirestoreMessage);
//  }
//}
//
//class SendMessageRequestArg {
//
//  final senderProfileId;
//  final receiverProfileId;
//
//  SendMessageRequestArg(this.senderProfileId, this.receiverProfileId);
//}
