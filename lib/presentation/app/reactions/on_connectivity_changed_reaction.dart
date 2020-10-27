import 'package:architecture/presentation/reaction/reaction.dart';
import 'package:yo_app/data/boxes/is_profile_updated_box.dart';

class OnConnectivityChangedReaction extends Reaction<bool> {

  final IsProfileUpdatedBox _isProfileUpdatedBox;

  OnConnectivityChangedReaction(this._isProfileUpdatedBox);

  @override
  void excite(bool isConnectionAvailable) {
    if (!isConnectionAvailable) {
      _isProfileUpdatedBox.data = false;
    }
  }
}
