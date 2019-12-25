import '../../../../../architecture/data/operation/operation.dart';
import '../../../../model/message.dart';
import '../../tools/firestore/firestore_entry.dart';
import '../../tools/firestore/message/firestore_message.dart';
import '../../tools/firestore/message/firestore_message_mapper.dart';

class SendMessageOperation extends Operation<SendMessageOperationArg, Message> {

  final FirestoreEntry _firestoreEntry;
  final FirestoreMessageMapper _mapper;

  SendMessageOperation(this._firestoreEntry, this._mapper);

  @override
  Future<Message> execute(SendMessageOperationArg arg) async {
    final sendingFirestoreMessage = FirestoreMessage(null, arg.senderProfileId, arg.receiverProfileId);
    final createdFirestoreMessage = await _firestoreEntry.messages.add(sendingFirestoreMessage);
    return _mapper.toMessage(createdFirestoreMessage);
  }
}

class SendMessageOperationArg {

  final senderProfileId;
  final receiverProfileId;

  SendMessageOperationArg(this.senderProfileId, this.receiverProfileId);
}
