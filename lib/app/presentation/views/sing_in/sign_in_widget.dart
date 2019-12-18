import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignInWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) => Material(child: _buildCenteredBody());

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

    if (true) {
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
    if (true) {
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

  Widget _buildPhoneField() => _buildTextField("Yo phone", TextInputType.phone);

  Widget _buildSmsField() => _buildTextField("Sms code", TextInputType.number);

  Widget _buildTextField(String hint, TextInputType textInputType) =>
      TextField(
        keyboardType: textInputType,
        style: TextStyle(fontSize: 18),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(16),
            hintText: hint,
            border: OutlineInputBorder()
        ),
        onChanged: (text) => {},
        onSubmitted: (text) => {},
      );

  Widget _buildAuthBtn() => _buildBtn("Log in", () {});

  Widget _buildContinueBtn() => _buildBtn("Continue", () {});

  Widget _buildBtn(String text, VoidCallback onPressed) =>
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
