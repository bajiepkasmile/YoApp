import '../../../../../architecture/presentation/reaction/reaction.dart';
import '../../../../models/profile.dart';
import '../profile_model.dart';

class OnProfileUpdateReaction extends Reaction<Profile> {

  final ProfileModel _model;

  OnProfileUpdateReaction(this._model);

  @override
  void excite(Profile profile) {
    _model.profile = profile;
    _model.refresh();
  }
}
