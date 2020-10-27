import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_utils/architecture/presentation/navigation/targets/queue/queue_target.dart';

class QueueTargetWidget extends StatefulWidget {

  final QueueTarget _target;

  QueueTargetWidget(this._target);

  @override
  State<QueueTargetWidget> createState() => _QueueTargetWidgetState();
}

class _QueueTargetWidgetState extends State<QueueTargetWidget> {

  StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = widget._target.onChangeStream.listen((event) => setState(() {}));
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget._target.builder(context);
}
