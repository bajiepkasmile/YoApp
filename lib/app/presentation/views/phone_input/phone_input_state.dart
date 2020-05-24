import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../architecture/presentation/navigation/route_bundle.dart';
import '../../../../flutter_utils/architecture/presentation/scope/scope_bundle.dart';
import '../../../../flutter_utils/architecture/presentation/view/widget_state.dart';
import '../../../../flutter_utils/architecture/presentation/view/widget_model_bundle.dart';
import '../../../models/input_status.dart';
import '../../widgets/input_status_button.dart';
import '../../widgets/input_status_widget.dart';
import '../../app/yo_app_scope.dart';
import '../../resources/app_colors.dart';
import 'phone_input_model.dart';
import 'phone_input_scope.dart';

class PhoneInputState extends WidgetState<YoAppScope, PhoneInputScope, PhoneInputModel, void, void> {

  PhoneInputState(RouteBundle<YoAppScope, void, void> bundle) : super(bundle);

  @override
  PhoneInputScope createScope(ScopeBundle<YoAppScope, PhoneInputModel, void, void> bundle) => PhoneInputScope(bundle);

  @override
  PhoneInputModel createViewModel(WidgetModelBundle<void> bundle) => PhoneInputModel(bundle);

  @override
  Widget build(BuildContext context) =>
      Scaffold(
          body: SafeArea(
              child: Stack(
                  children: [
                    _buildBody(),
                    _buildFooter()
                  ]
              )
          )
      );

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
          onSubmitted: (text) => scope.onPhoneSubmittedReaction.excite(null)
      );

  Widget _buildFooter() =>
      Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
              _buildTermsOfUseButton(),
              SizedBox(height: 10),
              _buildNextButton(),
              SizedBox(height: 20)
          ]
      );

  Widget _buildTermsOfUseButton() =>
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_buildUnsizedTermsOfUseButton()]
      );

  Widget _buildUnsizedTermsOfUseButton() =>
      FlatButton(
          padding: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          onPressed: () => scope.onOpenTermsOfUseReaction.excite(null),
          child: _buildTermsOfUseButtonText()
      );

  Widget _buildTermsOfUseButtonText() =>
      RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              style: TextStyle(height: 1.57, color: AppColors.gray),
              children: [
                  TextSpan(text: "By clicking on the button, you agree\nwith rules for "),
                  TextSpan(
                      text: "processing",
                      style: TextStyle(color: theme.primaryColor, decoration: TextDecoration.underline)
                  ),
                  TextSpan(text: " personal data")
              ]
          )
      );

  Widget _buildNextButton() =>
      SizedBox(
          width: 212,
          height: 60,
          child: InputStatusButton(
              text: "Next",
              status: _getButtonStatus(),
              onPressed: () => scope.onPhoneSubmittedReaction.excite(null)
          )
      );

  InputStatus _getButtonStatus() => model.status == InputStatus.loading ? InputStatus.inactive : model.status;
}
