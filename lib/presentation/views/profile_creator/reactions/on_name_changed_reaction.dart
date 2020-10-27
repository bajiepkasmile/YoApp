import 'package:architecture/presentation/reaction/reaction.dart';
import 'package:yo_app/models/input_status.dart';
import 'package:yo_app/presentation/views/profile_creator/profile_creator_model.dart';

class OnNameChangedReaction extends Reaction<String> {
  
  final ProfileCreatorModel _model;

  OnNameChangedReaction(this._model);

  @override
  void excite(String name) {
    _model.name = name;
    if (name.length == 0) {
      _model.status = InputStatus.inactive;
    } else {
      _model.status = InputStatus.active;
    }
    _model.refresh();
  }
}
