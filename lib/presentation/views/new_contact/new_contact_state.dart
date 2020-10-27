import 'dart:io';

import 'package:architecture/presentation/navigation/route_bundle.dart';
import 'package:architecture/presentation/reaction/reaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_utils/architecture/presentation/scope/scope_bundle.dart';
import 'package:flutter_utils/architecture/presentation/view/widget_model_bundle.dart';
import 'package:flutter_utils/architecture/presentation/view/widget_state.dart';
import 'package:yo_app/models/input_status.dart';
import 'package:yo_app/presentation/app/yo_app_scope.dart';
import 'package:yo_app/presentation/resources/app_colors.dart';
import 'package:yo_app/presentation/views/new_contact/new_contact_model.dart';
import 'package:yo_app/presentation/views/new_contact/new_contact_scope.dart';
import 'package:yo_app/presentation/widgets/input_status_button.dart';
import 'package:yo_app/presentation/widgets/input_status_widget.dart';

class NewContactState extends WidgetState<YoAppScope, NewContactScope, NewContactModel, void, void> {

  NewContactState(RouteBundle<YoAppScope, void, void> bundle) : super(bundle);

  @override
  NewContactScope createScope(ScopeBundle<YoAppScope, NewContactModel, void, void> bundle) => NewContactScope(bundle);

  @override
  NewContactModel createViewModel(WidgetModelBundle<void> bundle) => NewContactModel(bundle);

  @override
  Widget build(BuildContext context) =>
      Scaffold(
          appBar: _buildAppBar(),
          body: SafeArea(
              child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    _buildBody(),
                    _buildFooter()
                  ]
              )
          )
      );

  Widget _buildAppBar() =>
      AppBar(
          title: Text("New contact", style: TextStyle(color: AppColors.darkGray)),
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(_getBackIcon(), color: AppColors.darkGray),
              onPressed: () => scope.onBackReaction.excite(null)
          )
      );

  IconData _getBackIcon() => Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back;

  Widget _buildBody() =>
      Center(
          child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 165, bottom: 165),
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
            _buildPhoneTitle(),
            SizedBox(height: 2),
            _buildPhoneField(),
            SizedBox(height: 30),
            InputStatusWidget(model.status, "Check your internet connection")
          ]
      );

  Widget _buildPhoneTitle() =>
      Text(
          'Enter phone number',
          style: TextStyle(
              fontSize: 18,
              height: 1.5534,
              color: AppColors.darkGray70
          )
      );

  Widget _buildPhoneField() =>
      Container(
          padding: EdgeInsets.only(left: 48, right: 48),
          child: _buildUnsizedPhoneField()
      );

  Widget _buildUnsizedPhoneField() =>
      TextField(
          keyboardType: TextInputType.phone,
          textAlign: TextAlign.center,
          autofocus: true,
          inputFormatters: [
            WhitelistingTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(16),
          ],
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).primaryColor
          ),
          decoration: InputDecoration(
              prefixText: "+",
              contentPadding: EdgeInsets.all(18),
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.purple10, width: 2)),
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.purple10, width: 2))
          ),
          onChanged: (text) => scope.onPhoneChangedReaction.excite(text),
          onSubmitted: (text) => scope.onAddContactReaction.excite(null)
      );

  Widget _buildFooter() =>
      Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
              if (model.canInvite) ...[
                  _buildInviteHint(),
                  SizedBox(height: 20)
              ],
              _buildButton(),
              SizedBox(height: 20)
          ]
      );

  Widget _buildInviteHint() =>
      Text(
          "This user does not exist, you can invite him",
          style: TextStyle(fontSize: 14, color: theme.primaryColor)
      );

  Widget _buildButton() =>
      SizedBox(
          width: 212,
          height: 60,
          child: InputStatusButton(
              text: model.canInvite ? "Invite" : "Add contact",
              status: model.status == InputStatus.loading ? InputStatus.inactive : model.status,
              onPressed: () => _getButtonReaction().excite(null)
          )
      );

  Reaction<void> _getButtonReaction() => model.canInvite ? scope.onInviteContactReaction : scope.onAddContactReaction;
}
