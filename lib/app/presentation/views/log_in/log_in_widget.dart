import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../flutter_utils/architecture/presentation/scope/scope_bundle.dart';
import '../../../../flutter_utils/architecture/presentation/view/view_state.dart';
import '../../../../flutter_utils/architecture/presentation/view/view_widget.dart';
import '../../../../architecture/presentation/navigation/route_bundle.dart';
import '../../app/yo_app_scope.dart';
import 'log_in_model.dart';
import 'log_in_scope.dart';

class LogInWidget extends ViewWidget<YoAppScope, LogInScope, void, void, LogInModel> {

  LogInWidget(RouteBundle<YoAppScope, void, void> routeBundle) : super(routeBundle);

  @override
  LogInScope createScope(ScopeBundle<YoAppScope, void, void, LogInModel> bundle) => LogInScope(bundle);

  @override
  LogInModel createViewModel(ViewState state, void arg) => LogInModel(state);

  @override
  Widget build() => Material(child: _buildCenteredBody());

  Widget _buildCenteredBody() =>
      Center(
          child: Container(
              margin: EdgeInsets.only(left: 32, right: 32),
              width: double.infinity,
              child: Column(mainAxisSize: MainAxisSize.min, children: _buildBody()),
          )
      );

  List<Widget> _buildBody() {
    final bodyWidgets = <Widget>[];
    bodyWidgets.addAll(_buildLogo());

    if (model.isLoading) {
      bodyWidgets.addAll(_buildLoading());
    } else {
      bodyWidgets.addAll(_buildAuth());
    }

    return bodyWidgets;
  }

  List<Widget> _buildLogo() => [
    Text("Yo", style: TextStyle(color: Colors.grey, fontSize: 64, fontWeight: FontWeight.w600)),
    SizedBox(height: 56),
  ];

  List<Widget> _buildLoading() =>
      [
        SizedBox(height: 35),
        CircularProgressIndicator(),
        SizedBox(height: 50),
      ];

  List<Widget> _buildAuth() {
    if (!model.isPhoneSubmitted) {
      return _buildPhoneAuth();
    } else {
      return _buildSmsConfirmation();
    }
  }

  List<Widget> _buildPhoneAuth() =>
      [
        _buildPhoneField(),
        SizedBox(height: 20),
        _buildAuthBtn()
      ];

  List<Widget> _buildSmsConfirmation() =>
      [
        _buildSmsField(),
        SizedBox(height: 20),
        _buildContinueBtn()
      ];

  Widget _buildPhoneField() => _buildTextField(
      "Yo phone",
      TextInputType.phone,
      onChanged: (text) => scope.onPhoneChangedReaction.excite(text),
      onSubmitted: (text) => scope.onPhoneSubmittedReaction.excite(null)
  );

  Widget _buildSmsField() => _buildTextField(
      "Sms code",
      TextInputType.number,
      onChanged: (text) => scope.onSmsCodeChangedReaction.excite(text),
      onSubmitted: (text) => scope.onSmsCodeSubmittedReaction.excite(null)
  );

  Widget _buildTextField(
      String hint,
      TextInputType textInputType,
      {
        ValueChanged<String> onChanged,
        ValueChanged<String> onSubmitted
      }
  ) =>
      TextField(
        keyboardType: textInputType,
        style: TextStyle(fontSize: 18),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(16),
            hintText: hint,
            border: OutlineInputBorder()
        ),
        onChanged: onChanged,
        onSubmitted: onSubmitted,
      );

  Widget _buildAuthBtn() => _buildBtn("Log in", onPressed: () => scope.onPhoneSubmittedReaction.excite(null));

  Widget _buildContinueBtn() => _buildBtn("Continue", onPressed: () => scope.onSmsCodeSubmittedReaction.excite(null));

  Widget _buildBtn(String text, { VoidCallback onPressed }) =>
      SizedBox(
          width: double.infinity,
          child: RaisedButton(
            child: Text(text, style: TextStyle(color: Colors.white, fontSize: 16)),
            padding: EdgeInsets.only(top: 12, bottom: 12),
            color: Colors.grey,
            elevation: 4,
            onPressed: onPressed,
          )
      );
}
