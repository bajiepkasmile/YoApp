import 'dart:io';

import 'package:architecture/presentation/navigation/route_bundle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_utils/architecture/presentation/scope/scope_bundle.dart';
import 'package:flutter_utils/architecture/presentation/view/widget_model_bundle.dart';
import 'package:flutter_utils/architecture/presentation/view/widget_state.dart';
import 'package:yo_app/presentation/app/yo_app_scope.dart';
import 'package:yo_app/presentation/resources/app_colors.dart';
import 'package:yo_app/presentation/utils/sms_code_input_formatter.dart';
import 'package:yo_app/presentation/views/sms_input/sms_input_arg.dart';
import 'package:yo_app/presentation/views/sms_input/sms_input_model.dart';
import 'package:yo_app/presentation/views/sms_input/sms_input_scope.dart';
import 'package:yo_app/presentation/widgets/input_status_widget.dart';

class SmsInputState extends WidgetState<YoAppScope, SmsInputScope, SmsInputModel, SmsInputArg, void> {

  SmsInputState(RouteBundle<YoAppScope, void, void> bundle) : super(bundle);

  @override
  SmsInputScope createScope(ScopeBundle<YoAppScope, SmsInputModel, void, void> bundle) => SmsInputScope(bundle);

  @override
  SmsInputModel createViewModel(WidgetModelBundle<SmsInputArg> bundle) => SmsInputModel(bundle);

  @override
  void initState() {
    super.initState();
    scope.onInitReaction.excite(null);
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(
          body: SafeArea(
              child: Stack(
                  children: [
                    _buildBackBtn(),
                    _buildBody(),
                    _buildSendSmsBtn()
                  ]
              )
          )
      );

  Widget _buildBackBtn() =>
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
              padding: EdgeInsets.only(top: 95, bottom: 95),
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
              _buildSmsTitle(),
              SizedBox(height: 2),
              _buildSmsField(),
              SizedBox(height: 30),
              InputStatusWidget(model.status, "Check your internet connection")
          ]
      );

  Widget _buildSmsTitle() =>
      Text(
          'Enter code confirmation from SMS',
          style: TextStyle(
              fontSize: 18,
              height: 1.5534,
              color: AppColors.darkGray70
          )
      );

  Widget _buildSmsField() =>
      Container(
          padding: EdgeInsets.only(left: 48, right: 48),
          child: _buildUnsizedSmsField()
      );

  Widget _buildUnsizedSmsField() =>
      TextField(
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          inputFormatters: [SmsCodeInputFormatter()],
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: theme.primaryColor
          ),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(18),
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.purple10, width: 2)),
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.purple10, width: 2))
          ),
          onChanged: (text) => scope.onSmsCodeChangedReaction.excite(text),
          onSubmitted: (text) => scope.onSmsCodeSubmittedReaction.excite(null)
      );

  Widget _buildSendSmsBtn() =>
      Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              height: 65,
              padding: EdgeInsets.only(bottom: 20),
              child: _buildUnsizedSendSmsBtn()
          )
      );

  Widget _buildUnsizedSendSmsBtn() =>
      FlatButton(
          padding: EdgeInsets.only(left: 20, right: 20),
          onPressed: () => model.canSendSms ? scope.onSendSmsReaction.excite(null) : null,
          child: _buildSendSmsBtnText()
      );

  Widget _buildSendSmsBtnText() =>
      RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              children: [
                  TextSpan(text: "Send SMS again", style: TextStyle(color: AppColors.darkGray)),
                  if (!model.canSendSms)
                    TextSpan(text: " (${model.secondsLeft}s)", style: TextStyle(color: AppColors.darkGray70))
              ]
          )
      );
}
