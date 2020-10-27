import 'package:dart_utils/object_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yo_app/models/input_status.dart';

class InputStatusButton extends StatelessWidget {
  
  final Widget child;
  final String text;
  final InputStatus status;
  final VoidCallback onPressed;

  InputStatusButton({this.child, this.text, this.status, this.onPressed});

  @override
  Widget build(BuildContext context) =>
      FlatButton(
          textColor: Colors.white,
          disabledTextColor: Theme.of(context).primaryColor,
          color: Theme.of(context).primaryColor,
          disabledColor: Colors.white,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Theme.of(context).primaryColor, width: 2),
              borderRadius: BorderRadius.circular(30)
          ),
          onPressed: _createCallback(),
          child: _buildAnimatedStatus(context)
      );

  VoidCallback _createCallback() => status.oneOf([InputStatus.inactive, InputStatus.loading]) ? null : onPressed;

  Widget _buildAnimatedStatus(BuildContext context) =>
      AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          switchInCurve: Interval(0.5, 1),
          switchOutCurve: Interval(0.5, 1),
          transitionBuilder: (child, animation) => ScaleTransition(child: child, scale: animation),
          child: _buildStatus(context)
      );

  Widget _buildStatus(BuildContext context) => status == InputStatus.loading ? _buildLoading(context) : _buildChild();

  Widget _buildLoading(BuildContext context) =>
      SizedBox(
          width: 30,
          height: 30,
          child: CircularProgressIndicator(
              strokeWidth: 4,
              valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor)
          )
      );

  Widget _buildChild() =>
      child != null
          ? child
          : Text(text, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, height: 1.22));
}
