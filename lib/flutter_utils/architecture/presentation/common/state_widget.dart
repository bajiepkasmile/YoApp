import 'package:flutter/widgets.dart';

class StateWidget extends StatefulWidget {

  final State<StatefulWidget> _state;

  StateWidget(this._state) : super(key: ValueKey(_state.hashCode));

  @override
  State<StatefulWidget> createState() => _state;
}
