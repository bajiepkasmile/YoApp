import 'package:yo_app/models/chat.dart';
import 'package:yo_app/models/chat_with_profile_id.dart';
import 'package:yo_app/tools/floor/chat/floor_chat.dart';

class FloorChatMapper {

  FloorChat fromChatWithProfileId(ChatWithProfileId chatWithProfileId) =>
      FloorChat(
        chatWithProfileId.profileId,
        chatWithProfileId.chat.hiTime.millisecondsSinceEpoch,
        chatWithProfileId.chat.contactHiTime.millisecondsSinceEpoch,
        chatWithProfileId.chat.isContactHiViewed,
        chatWithProfileId.chat.totalSentLikesCount,
        chatWithProfileId.chat.lastReceivedLikesCount,
        chatWithProfileId.chat.isLastReceivedLikesCountViewed,
        chatWithProfileId.chat.lastReceivedLikesTime.millisecondsSinceEpoch
      );

  ChatWithProfileId toChatWithProfileId(FloorChat floorChat) =>
      ChatWithProfileId(
          Chat(
              DateTime.fromMillisecondsSinceEpoch(floorChat.hiMillisecondsSinceEpoch),
              DateTime.fromMillisecondsSinceEpoch(floorChat.contactHiMillisecondsSinceEpoch),
              floorChat.isContactHiViewed,
              floorChat.totalSentLikesCount,
              floorChat.lastReceivedLikesCount,
              floorChat.isLastReceivedLikesCountViewed,
              DateTime.fromMillisecondsSinceEpoch(floorChat.lastReceivedLikesMillisecondsSinceEpoch)
          ),
          floorChat.profileId
      );
}
