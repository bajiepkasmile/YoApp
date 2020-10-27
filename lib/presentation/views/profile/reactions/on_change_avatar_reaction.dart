import 'package:architecture/presentation/reaction/reaction.dart';
import 'package:yo_app/data/tasks/profiles/set_avatar_task.dart';
import 'package:yo_app/presentation/views/image_picker/image_picker_route.dart';
import 'package:yo_app/presentation/views/image_source/image_source_route.dart';
import 'package:yo_app/presentation/views/profile/profile_model.dart';

class OnChangeAvatarReaction extends Reaction<void> {

  final ImageSourceRoute _imageSourceRoute;
  final ImagePickerRoute _imagePickerRoute;
  final SetAvatarTask _setAvatarTask;
  final ProfileModel _model;

  OnChangeAvatarReaction(this._imageSourceRoute, this._imagePickerRoute, this._setAvatarTask, this._model);

  @override
  void excite(void arg) async {
    final source = await _imageSourceRoute.add(null);
    final file =  await _imagePickerRoute.add(source);
    _model.profile = await _setAvatarTask.execute(file);
    _model.refresh();
  }
}
