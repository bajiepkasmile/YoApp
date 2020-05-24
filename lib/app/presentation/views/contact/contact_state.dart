import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../flutter_utils/architecture/presentation/scope/scope_bundle.dart';
import '../../../../flutter_utils/architecture/presentation/view/widget_model_bundle.dart';
import '../../../../flutter_utils/architecture/presentation/view/widget_state.dart';
import '../../../../flutter_utils/utils/transform_extension.dart';
import '../../../../dart_utils/string_extension.dart';
import '../../../../architecture/presentation/navigation/route_bundle.dart';
import '../../../models/contact.dart';
import '../../../models/achievement.dart';
import '../../../models/emoji.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_images.dart';
import '../../widgets/input_status_button.dart';
import '../../app/yo_app_scope.dart';
import 'contact_model.dart';
import 'contact_scope.dart';

class ContactState extends WidgetState<YoAppScope, ContactScope, ContactModel, Contact, void> {

  ContactState(RouteBundle<YoAppScope, Contact, void> routeBundle) : super(routeBundle);

  @override
  ContactScope createScope(ScopeBundle<YoAppScope, ContactModel, Contact, void> bundle) => ContactScope(bundle);

  @override
  ContactModel createViewModel(WidgetModelBundle<Contact> bundle) => ContactModel(bundle);

  @override
  Widget build(BuildContext context) =>
      Scaffold(
          appBar: _buildAppBar(),
          body: _buildBody()
      );

  Widget _buildAppBar() =>
      AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back, color: Colors.black),
              onPressed: () => scope.onBackReaction.excite(null)
          )
      );

  Widget _buildBody() =>
      Stack(
          alignment: Alignment.bottomCenter,
          children: [
            _buildInfo(),
            _buildFooter()
          ]
      );

  Widget _buildFooter() =>
      Container(
          height: 178,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0x00FFFFFF), Colors.white]
              )
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                  _buildMaxLikesText(),
                  SizedBox(height: 13),
                  _buildChatButton(),
                  SizedBox(height: 30)
              ],
          )
      );

  Widget _buildMaxLikesText() =>
      model.arg.canSendLike
          ? Text("You set maximum likes", style: TextStyle(fontSize: 16, color: theme.primaryColor))
          : SizedBox();

  Widget _buildChatButton() =>
      SizedBox(
          width: 195,
          height: 60,
          child: !model.arg.chat.isHiSent ? _buildHiButton() : _buildLikeButton()
      );

  Widget _buildHiButton() =>
      InputStatusButton(
          text: "Send \"Hi\"",
          status: model.status,
          onPressed: () => scope.onHiReaction.excite(null)
      );

  Widget _buildLikeButton() =>
      InputStatusButton(
          status: model.status,
          onPressed: () => scope.onLikeReaction.excite(null),
          child: Row(
              children: [
                SvgPicture.asset(AppImages.icHeartFilled),
                Text("Like", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, height: 1.22))
              ],
          )
      );

  Widget _buildInfo() =>
      ListView(
          padding: EdgeInsets.only(top: 60, left: 25, right: 25),
          children: [
              _buildHeader(),
              SizedBox(height: 27),
              _buildName(),
              SizedBox(height: 84),
              _buildLikes(),
              SizedBox(height: 30),
              ..._buildAchievements()
          ]
      );

  Widget _buildHeader() =>
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: 78),
            _buildAvatar(),
            SizedBox(width: 28),
            _buildShareButton()
          ]
      );

  Widget _buildAvatar() =>
      Container(
          child: _buildUnsizedAvatar(),
          alignment: Alignment.center,
          width: 111,
          height: 111,
          decoration: BoxDecoration(color: AppColors.yellow, borderRadius: BorderRadius.all(Radius.circular(30))),
      );

  Widget _buildUnsizedAvatar() =>
      model.arg.avatarFile != null
          ? ClipRRect(borderRadius: BorderRadius.circular(30), child: Image.file(model.arg.avatarFile))
          : Image.asset(AppImages.imgEmojiStarStruckBig);

  Widget _buildShareButton() =>
      SizedBox(
          width: 50,
          height: 50,
          child: FlatButton(
              child: TransformExtension.flip(Icon(Icons.reply, color: AppColors.darkGray)),
              padding: EdgeInsets.all(0),
              color: AppColors.darkGray3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
              onPressed: () => scope.onShareReaction.excite(null)
          )
      );

  Widget _buildName() =>
      Text(
          model.arg.name,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 29, color: AppColors.darkGray, height: 1.207),
      );

  Widget _buildLikes() =>
      Row(
          children: [
              _buildLikesIcon(),
              SizedBox(width: 20),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLikesCount(),
                    SizedBox(height: 7),
                    _buildLikesLabel()
                  ]
              )
          ]
      );

  Widget _buildLikesCount() =>
      Text(
          _getLikesCountStr(),
          style: TextStyle(color: AppColors.darkGray, fontWeight: FontWeight.bold, fontSize: 23, height: 1.174)
      );

  Widget _buildLikesLabel() =>
      Text(
          "Likes",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: AppColors.lightGray, height: 1.188)
      );

  Widget _buildLikesIcon() =>
      Container(
          width: 55,
          height: 55,
          child: SvgPicture.asset(AppImages.icAchievement, color: AppColors.orange, fit: BoxFit.none),
          decoration: BoxDecoration(color: AppColors.orange10, borderRadius: BorderRadius.all(Radius.circular(17))),
      );

  String _getLikesCountStr() {
    var likesCountStr = model.arg.likesCount.toString();

    if (likesCountStr.length > 6) {
      likesCountStr = likesCountStr.insert(" ", likesCountStr.length - 6);
    }

    if (likesCountStr.length > 3) {
      likesCountStr = likesCountStr.insert(" ", likesCountStr.length - 3);
    }

    return likesCountStr;
  }

  List<Widget> _buildAchievements() =>
      model.arg.achievements
          .map((achievement) => _buildAchievement(achievement))
          .toList();

  Widget _buildAchievement(Achievement achievement) =>
      Container(
          child: _buildAchievementRow(achievement.description, achievement.emoji),
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          margin: EdgeInsets.only(bottom: 14),
          decoration: BoxDecoration(
              color: achievement.color,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)
              )
          )
      );

  Widget _buildAchievementRow(String description, Emoji emoji) =>
      Row(
          children: [
              Image.asset(_getEmojiName(emoji)),
              SizedBox(width: 20),
              Expanded(
                  child: Text(
                      description,
                      style: TextStyle(fontSize: 16, height: 1.446, color: AppColors.darkGray),
                      textAlign: TextAlign.left
                  )
              )
          ]
      );

  String _getEmojiName(Emoji emoji) {
    switch(emoji) {
      case Emoji.heartEyes: return AppImages.imgEmojiHeartEyes;
      case Emoji.squinting: return AppImages.imgEmojiSquinting;
      case Emoji.sunglasses: return AppImages.imgEmojiSunglasses;
      case Emoji.thumbsUp: return AppImages.imgEmojiThumbsUp;
      default: return null;
    }
  }
}
