import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../../../../../architecture/presentation/navigation/route_trace.dart';
import '../../../../../architecture/presentation/reaction/reaction.dart';

class OnSelectImageSourceReaction extends Reaction<ImageSource> {

  final RouteTrace<ImageSource> _trace;

  OnSelectImageSourceReaction(this._trace);

  @override
  void excite(ImageSource source) async {
    _trace.pop(source);
  }
}
