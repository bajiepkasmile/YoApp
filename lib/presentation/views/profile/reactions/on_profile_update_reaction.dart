import 'package:architecture/presentation/reaction/reaction.dart';
import 'package:yo_app/models/profile.dart';
import 'package:yo_app/presentation/views/profile/profile_model.dart';

class OnProfileUpdateReaction extends Reaction<Profile> {

  final ProfileModel _model;

  OnProfileUpdateReaction(this._model);

  @override
  void excite(Profile profile) {
    _model.profile = profile;
    _model.refresh();
  }
}
