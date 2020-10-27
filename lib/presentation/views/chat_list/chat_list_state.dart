import 'package:architecture/presentation/navigation/route_bundle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_utils/architecture/presentation/scope/scope_bundle.dart';
import 'package:flutter_utils/architecture/presentation/view/widget_model_bundle.dart';
import 'package:flutter_utils/architecture/presentation/view/widget_state.dart';
import 'package:intl/intl.dart';
import 'package:yo_app/models/chat.dart';
import 'package:yo_app/models/contact.dart';
import 'package:yo_app/presentation/app/yo_app_scope.dart';
import 'package:yo_app/presentation/resources/app_colors.dart';
import 'package:yo_app/presentation/resources/app_images.dart';
import 'package:yo_app/presentation/views/chat_list/chat_list_model.dart';
import 'package:yo_app/presentation/views/chat_list/chat_list_scope.dart';
import 'package:yo_app/presentation/widgets/initials_circle_avatar.dart';

class ChatListState extends WidgetState<YoAppScope, ChatListScope, ChatListModel, void, void> {

  ChatListState(RouteBundle<YoAppScope, void, void> bundle) : super(bundle);

  @override
  ChatListScope createScope(ScopeBundle<YoAppScope, ChatListModel, void, void> bundle) => ChatListScope(bundle);

  @override
  ChatListModel createViewModel(WidgetModelBundle<void> bundle) => ChatListModel(bundle);

  @override
  Widget build(BuildContext context) =>
      Scaffold(
          appBar: _buildAppBar(),
          body: _buildBody()
      );

  Widget _buildAppBar() =>
      AppBar(
          backgroundColor: Colors.white,
          title: Text("Chats", style: TextStyle(color: AppColors.darkGray))
      );

  Widget _buildBody() => model.contacts.isNotEmpty ? _buildChats() : _buildEmpty();

  Widget _buildChats() =>
      ListView.builder(
          itemCount: model.contacts.length,
          itemBuilder: (context, index) => _buildChatItem(model.contacts[index])
      );

  Widget _buildChatItem(Contact contact) =>
      ListTile(
          leading: _buildAvatar(contact),
          title: _buildName(contact.name),
          subtitle: _buildLabels(contact.chat),
          trailing: _buildTime(contact.chat.lastReceivedLikesTime),
          contentPadding: EdgeInsets.symmetric(vertical: 9, horizontal: 25)
      );

  Widget _buildAvatar(Contact contact) =>
      SizedBox(
          width: 60,
          height: 60,
          child: contact.avatar != null
              ? CircleAvatar(backgroundImage: FileImage(contact.avatar.file), radius: 30)
              : InitialsCircleAvatar(contact.name)
      );

  Widget _buildName(String name) =>
      Padding(
          padding: EdgeInsets.only(bottom: 9),
          child: Text(
              name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, height: 1.22, color: AppColors.darkGray)
          )
      );

  Widget _buildLabels(Chat chat) {
    final labels = <Widget>[];

    if (!chat.isContactHiViewed) {
      labels.add(_buildHiLabel(Colors.white, AppColors.orange));
      labels.add(SizedBox(width: 7));
    } else if (chat.lastReceivedLikesCount == 0) {
      labels.add(_buildHiLabel(AppColors.gray, AppColors.darkGray3));
    }

    if (chat.lastReceivedLikesCount != 0) {
      if (chat.isLastReceivedLikesCountViewed) {
        labels.add(_buildLikesCountLabel(chat.lastReceivedLikesCount, AppColors.gray, AppColors.darkGray3));
      } else {
        labels.add(_buildLikesCountLabel(chat.lastReceivedLikesCount, Colors.white, theme.primaryColor));
      }
    }

    return Row(children: labels);
  }

  Widget _buildHiLabel(Color textColor, Color backgroundColor) =>
      _buildLabel(
          backgroundColor,
          Text("Hi!", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: textColor))
      );

  Widget _buildLikesCountLabel(int likesCount, Color textColor, Color backgroundColor) =>
      _buildLabel(
          backgroundColor,
          Row(
              children: [
                  SvgPicture.asset(AppImages.icHeartFilled, color: textColor, width: 12, height: 12),
                  SizedBox(width: 5),
                  Text("$likesCount", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: textColor))
              ]
          )
      );

  Widget _buildLabel(Color backgroundColor, Widget child) =>
      Container(
          height: 23,
          padding: EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(9), color: backgroundColor),
          child: child
      );

  Widget _buildTime(DateTime dateTime) =>
      Column(
          children: [
            SizedBox(height: 2),
            Text(
                _dateTimeToString(dateTime),
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, height: 1.47, color: AppColors.gray)
            )
          ]
      );

  String _dateTimeToString(DateTime dateTime) {
    final now = DateTime.now();

    final beforeYesterday = DateTime(now.year, now.month, now.day - 2);
    if (dateTime.compareTo(beforeYesterday) == -1) {
      return "${dateTime.day} ${DateFormat.MMM().format(dateTime)}";
    }

    final yesterday = DateTime(now.year, now.month, now.day - 1);
    if (dateTime.compareTo(yesterday) == -1) {
      return "Yesterday";
    }

    return "${dateTime.hour}:${dateTime.minute}";
  }

  Widget _buildEmpty() =>
      Stack(
          children: [
              _buildPlaceHolder(),
              _buildContactsArrow()
          ]
      );

  Widget _buildPlaceHolder() =>
      Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 32, right: 32),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildEmptyImage(),
                SizedBox(height: 42),
                _buildEmptyTitle(),
                _buildEmptySubtitle()
              ]
          )
      );

  Widget _buildEmptyImage() =>
      Container(
          width: 140,
          height: 140,
          decoration: BoxDecoration(color: AppColors.yellow, borderRadius: BorderRadius.circular(52)),
          child: Image.asset(AppImages.imgEmojiSlightlyFrowningBig)
      );

  Widget _buildEmptyTitle() =>
      Text(
          'You have no chats!',
          style: TextStyle(
            fontSize: 29,
            fontWeight: FontWeight.bold,
            height: 1.5534,
            color: AppColors.darkGray,
          )
      );

  Widget _buildEmptySubtitle() =>
      Text(
          'Look for friends here',
          style: TextStyle(
            fontSize: 18,
            height: 1.5534,
            color: AppColors.darkGray70
          )
      );

  Widget _buildContactsArrow() =>
      Container(
          padding: EdgeInsets.only(bottom: 24, right: 29),
          alignment: Alignment(0.5, 1),
          child: SvgPicture.asset(AppImages.imgCurvedArrow)
      );
}
