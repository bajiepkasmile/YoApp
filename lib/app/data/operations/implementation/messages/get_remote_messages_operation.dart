import '../../../../../architecture/data/operation/operation.dart';
import '../../../../model/message.dart';
import '../../tools/firestore/firestore_entry.dart';
import '../../tools/firestore/message/firestore_message.dart';
import '../../tools/firestore/message/firestore_message_mapper.dart';

class GetRemoteMessagesOperation extends Operation<GetRemoteMessagesOperationArg, List<Message>> {
  
  final FirestoreEntry _firestoreEntry;
  final FirestoreMessageMapper _mapper;

  GetRemoteMessagesOperation(this._firestoreEntry, this._mapper);

  @override
  Future<List<Message>> execute(GetRemoteMessagesOperationArg arg) async {
    final ids = [arg.senderProfileId, arg.receiverProfileId];
    final firebaseMessages = await _firestoreEntry.messages
        .where(FirestoreMessage.SENDER_PROFILE_ID_KEY, whereIn: ids)
        .where(FirestoreMessage.RECEIVER_PROFILE_ID_KEY, whereIn: ids)
        .loadAll()
    ;
    return firebaseMessages.map(_mapper.toMessage).toList();
  }
}

class GetRemoteMessagesOperationArg {

  final String senderProfileId;
  final String receiverProfileId;

  GetRemoteMessagesOperationArg(this.senderProfileId, this.receiverProfileId);
}
