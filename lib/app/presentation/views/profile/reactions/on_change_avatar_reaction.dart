import '../../../../../architecture/presentation/reaction/reaction.dart';
import '../../../../data/tasks/profiles/change_avatar_task.dart';
import '../../image_picker/image_picker_route.dart';
import '../../image_source/image_source_route.dart';
import '../../profile/profile_model.dart';

class OnChangeAvatarReaction extends Reaction<void> {

  final ImageSourceRoute _imageSourceRoute;
  final ImagePickerRoute _imagePickerRoute;
  final ChangeAvatarTask _changeAvatarTask;
  final ProfileModel _model;

  OnChangeAvatarReaction(this._imageSourceRoute, this._imagePickerRoute, this._changeAvatarTask, this._model);

  @override
  void excite(void arg) async {
    final source = await _imageSourceRoute.add(null);
    final file =  await _imagePickerRoute.add(source);
    _model.profile = await _changeAvatarTask.execute(file);
    _model.refresh();
  }
}
