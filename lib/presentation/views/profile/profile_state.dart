import 'dart:io';

import 'package:architecture/presentation/navigation/route_bundle.dart';
import 'package:architecture/presentation/reaction/reaction.dart';
import 'package:dart_utils/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_utils/architecture/presentation/scope/scope_bundle.dart';
import 'package:flutter_utils/architecture/presentation/view/widget_model_bundle.dart';
import 'package:flutter_utils/architecture/presentation/view/widget_state.dart';
import 'package:flutter_utils/utils/transform_extension.dart';
import 'package:yo_app/models/achievement.dart';
import 'package:yo_app/models/emoji.dart';
import 'package:yo_app/presentation/app/yo_app_scope.dart';
import 'package:yo_app/presentation/resources/app_colors.dart';
import 'package:yo_app/presentation/resources/app_images.dart';
import 'package:yo_app/presentation/views/profile/models/profile_popup_action.dart';
import 'package:yo_app/presentation/views/profile/profile_model.dart';
import 'package:yo_app/presentation/views/profile/profile_scope.dart';

class ProfileState extends WidgetState<YoAppScope, ProfileScope, ProfileModel, void, void> {

  ProfileState(RouteBundle<YoAppScope, void, void> bundle) : super(bundle);

  @override
  ProfileScope createScope(ScopeBundle<YoAppScope, ProfileModel, void, void> bundle) => ProfileScope(bundle);

  @override
  ProfileModel createViewModel(WidgetModelBundle<void> bundle) => ProfileModel(bundle);

  @override
  Widget build(BuildContext context) =>
      Scaffold(
          appBar: _buildAppBar(),
          body: _buildBody()
      );

  Widget _buildAppBar() =>
      AppBar(
          backgroundColor: Colors.white,
          title: Text("Profile", style: TextStyle(color: AppColors.darkGray)),
          actions: _buildActions()
      );

  List<Widget> _buildActions() => [
      PopupMenuButton<ProfilePopupAction>(
          icon: Icon(Platform.isIOS ? Icons.more_horiz : Icons.more_vert, color: AppColors.darkGray),
          itemBuilder: (context) => [
              PopupMenuItem(value: ProfilePopupAction.instagram, child: Text("Instagram")),
              PopupMenuItem(value: ProfilePopupAction.writeToDeveloper, child: Text("Write to developer")),
              PopupMenuItem(value: ProfilePopupAction.rateTheApp, child: Text("Rate the app")),
              PopupMenuItem(value: ProfilePopupAction.inviteFriends, child: Text("Invite friends")),
              PopupMenuItem(value: ProfilePopupAction.logOut, child: Text("Log out"))
          ],
          onSelected: (action) => _getActionReaction(action).excite(null)
      )
  ];

  Reaction _getActionReaction(ProfilePopupAction action) {
    switch (action) {
      case ProfilePopupAction.instagram: return scope.onOpenInstagramReaction;
      case ProfilePopupAction.inviteFriends: return scope.onInviteFriendsReaction;
      case ProfilePopupAction.rateTheApp: return scope.onRateReaction;
      case ProfilePopupAction.writeToDeveloper: return scope.onWriteToDevelopersReaction;
      case ProfilePopupAction.logOut: return scope.onLogOutReaction;
      default: return null;
    }
  }

  Widget _buildBody() =>
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
              _buildPhotoButton(),
              SizedBox(width: 28),
              _buildAvatar(),
              SizedBox(width: 28),
              _buildShareButton()
          ]
      );

  Widget _buildPhotoButton() =>
      _buildButton(
          Icon(Icons.photo_camera, color: AppColors.darkGray),
          () => scope.onChangeAvatarReaction.excite(null)
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
      model.profile.avatar != null
          ? ClipRRect(borderRadius: BorderRadius.circular(30), child: Image.file(model.profile.avatar.file))
          : Image.asset(AppImages.imgEmojiStarStruckBig);

  Widget _buildShareButton() =>
      _buildButton(
          TransformExtension.flip(Icon(Icons.reply, color: AppColors.darkGray)),
          () => scope.onShareReaction.excite(null)
      );

  Widget _buildButton(Widget child, VoidCallback onPressed) =>
      SizedBox(
          width: 50,
          height: 50,
          child: FlatButton(
              child: child,
              padding: EdgeInsets.all(0),
              color: AppColors.darkGray3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
              onPressed: onPressed
          )
      );

  Widget _buildName() =>
      Text(
          model.profile.name,
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
    var likesCountStr = model.profile.likesCount.toString();

    if (likesCountStr.length > 6) {
      likesCountStr = likesCountStr.insert(" ", likesCountStr.length - 6);
    }

    if (likesCountStr.length > 3) {
      likesCountStr = likesCountStr.insert(" ", likesCountStr.length - 3);
    }

    return likesCountStr;
  }

  List<Widget> _buildAchievements() =>
      model.profile.achievements
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
