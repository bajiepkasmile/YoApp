import 'dart:io';

import 'package:architecture/presentation/navigation/route_bundle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_utils/architecture/presentation/scope/scope_bundle.dart';
import 'package:flutter_utils/architecture/presentation/view/widget_model_bundle.dart';
import 'package:flutter_utils/architecture/presentation/view/widget_state.dart';
import 'package:yo_app/presentation/app/yo_app_scope.dart';
import 'package:yo_app/presentation/resources/app_colors.dart';
import 'package:yo_app/presentation/resources/app_images.dart';
import 'package:yo_app/presentation/views/profile_creator/profile_creator_model.dart';
import 'package:yo_app/presentation/views/profile_creator/profile_creator_scope.dart';
import 'package:yo_app/presentation/widgets/input_status_button.dart';

class ProfileCreatorState extends WidgetState<YoAppScope, ProfileCreatorScope, ProfileCreatorModel, void, void> {

  ProfileCreatorState(RouteBundle<YoAppScope, void, void> bundle) : super(bundle);

  @override
  ProfileCreatorScope createScope(ScopeBundle<YoAppScope, ProfileCreatorModel, void, void> bundle) =>
      ProfileCreatorScope(bundle);

  @override
  ProfileCreatorModel createViewModel(WidgetModelBundle<void> bundle) => ProfileCreatorModel(bundle);

  @override
  Widget build(BuildContext context) =>
      Scaffold(
          body: SafeArea(
              child: Stack(
                  children: [
                      _buildBackButton(),
                      _buildBody(),
                      _buildNextButton()
                  ]
              )
          )
      );

  Widget _buildBackButton() =>
      SizedBox(
          width: 66,
          height: 66,
          child: IconButton(
              icon: Icon(_getBackIcon()),
              onPressed: () => scope.onBackReaction.excite(null)
          )
      );

  IconData _getBackIcon() => Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back;

  Widget _buildBody() =>
      Center(
          child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 120, bottom: 120),
              reverse: true,
              physics: NeverScrollableScrollPhysics(),
              child: _buildUnalignedBody()
          )
      );

  Widget _buildUnalignedBody() =>
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              _buildAvatarButton(),
              SizedBox(height: 65),
              _buildNameTitle(),
              SizedBox(height: 2),
              _buildNameField()
          ]
      );

  Widget _buildAvatarButton() =>
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 91,
                height: 91,
                child: _buildUnalignedAvatarButton()
            )
          ]
      );

  Widget _buildUnalignedAvatarButton() =>
      FlatButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          color: AppColors.yellow,
          padding: EdgeInsets.all(0),
          onPressed: () => scope.onChangeAvatarReaction.excite(null),
          child: _buildAvatarButtonChild()
      );

  Widget _buildAvatarButtonChild() =>
      model.avatarFile != null
          ? ClipRRect(borderRadius: BorderRadius.circular(30), child: Image.file(model.avatarFile))
          : SvgPicture.asset(AppImages.icPhoto, color: theme.primaryColor);

  Widget _buildNameTitle() =>
      Text(
          'Your name',
          style: TextStyle(
              fontSize: 18,
              height: 1.5534,
              color: AppColors.darkGray70,
          )
      );

  Widget _buildNameField() =>
      Container(
          padding: EdgeInsets.only(left: 48, right: 48),
          child: _buildUnsizedNameField()
      );

  Widget _buildUnsizedNameField() =>
      TextField(
          keyboardType: TextInputType.text,
          textAlign: TextAlign.center,
          textCapitalization: TextCapitalization.words,
          maxLength: 20,
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: theme.primaryColor
          ),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(18),
              counterText: "",
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.purple10, width: 2)),
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.purple10, width: 2)),
          ),
          onChanged: (text) => scope.onNameChangedReaction.excite(text)
      );

  Widget _buildNextButton() =>
      Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              width: 212,
              height: 60,
              margin: EdgeInsets.only(bottom: 20),
              child: InputStatusButton(
                  text: "Next",
                  status: model.status,
                  onPressed: () => scope.onCreateProfileReaction.excite(null)
              )
          )
      );
}
