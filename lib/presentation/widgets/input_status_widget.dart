import 'package:flutter/material.dart';
import 'package:yo_app/models/input_status.dart';

class InputStatusWidget extends StatelessWidget {

  final InputStatus _status;
  final String _errorMessage;

  InputStatusWidget(this._status, this._errorMessage);

  @override
  Widget build(BuildContext context) => Container(
      height: 24,
      alignment: Alignment.center,
      child: _buildAnimatedStatus(context)
  );

  Widget _buildAnimatedStatus(BuildContext context) => AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      switchInCurve: Interval(0.5, 1),
      switchOutCurve: Interval(0.5, 1),
      transitionBuilder: (child, animation) => ScaleTransition(child: child, scale: animation),
      child: _buildStatus(context)
  );

  Widget _buildStatus(BuildContext context) {
    switch (_status) {
      case InputStatus.loading: return _buildLoading(context);
      case InputStatus.error: return _buildError(context);
      default: return null;
    }
  }

  //TODO: color
  Widget _buildLoading(BuildContext context) => SizedBox(
      width: 24,
      height: 24,
      child: CircularProgressIndicator(
          strokeWidth: 3,
          valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor),
          backgroundColor: Color(0xFFF0F5F8)
      )
  );

  Widget _buildError(BuildContext context) => Text(
      _errorMessage,
      style: TextStyle(fontWeight: FontWeight.w500, height: 1.57, color: Theme.of(context).errorColor)
  );
}
