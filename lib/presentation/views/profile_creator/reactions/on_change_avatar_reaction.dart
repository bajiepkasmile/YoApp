import 'package:architecture/presentation/reaction/reaction.dart';
import 'package:yo_app/presentation/views/image_cropper/image_cropper_route.dart';
import 'package:yo_app/presentation/views/image_picker/image_picker_route.dart';
import 'package:yo_app/presentation/views/image_source/image_source_route.dart';
import 'package:yo_app/presentation/views/profile_creator/profile_creator_model.dart';

class OnChangeAvatarReaction extends Reaction<void> {

  final ProfileCreatorModel _model;
  final ImageSourceRoute _imageSourceRoute;
  final ImagePickerRoute _imagePickerRoute;
  final ImageCropperRoute _imageCropperRoute;

  OnChangeAvatarReaction(this._model, this._imageSourceRoute, this._imagePickerRoute, this._imageCropperRoute);

  @override
  void excite(void arg) async {
    final source = await _imageSourceRoute.add(null);
    if (source == null) {
      return;
    }

    final file = await _imagePickerRoute.add(source);
    if (file == null) {
      return;
    }

    final croppedFile = await _imageCropperRoute.add(file);
    if (croppedFile == null) {
      return;
    }

    _model.avatarFile = croppedFile;
    _model.refresh();
  }
}
