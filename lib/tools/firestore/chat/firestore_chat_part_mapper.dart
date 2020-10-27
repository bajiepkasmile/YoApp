import 'package:yo_app/models/chat.dart';
import 'package:yo_app/tools/firestore/chat/firestore_chat_part.dart';
import 'package:yo_app/tools/floor/chat/floor_chat.dart';

class FirestoreChatPartMapper {

  Chat toChat(FirestoreChatPart profilePart, FirestoreChatPart contactPart) =>
      Chat(
        DateTime.fromMillisecondsSinceEpoch(firestoreChat.hiMillisecondsSinceEpoch),
        null,
        firestoreChat.isHiViewed,
        firestoreChat.totalSentLikesCount,
        firestoreChat.lastReceivedLikesCount,
        firestoreChat.isLastReceivedLikesCountViewed,
        DateTime.fromMillisecondsSinceEpoch(firestoreChat.lastReceivedLikesMillisecondsSinceEpoch)
      );

  FirestoreChatPart toContactChatPart(Chat chat) =>
      FirestoreChatPart(
        null,
        chat.hiTime.millisecondsSinceEpoch,
        null,
      );
}
