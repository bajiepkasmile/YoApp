import '../../../../../architecture/presentation/reaction/reaction.dart';
import '../profile_creator_model.dart';

class OnNameChangedReaction extends Reaction<String> {
  
  final ProfileCreatorModel _model;

  OnNameChangedReaction(this._model);

  @override
  void excite(String name) {
    _model.name = name;
  }
}
