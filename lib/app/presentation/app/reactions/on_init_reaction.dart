import '../../../../connectivity_utils/architecture/data/box/is_network_available_box.dart';
import '../../../../architecture/presentation/reaction/reaction.dart';
import '../../../data/repositories/self_profile_repository.dart';
import '../../../data/settings/self_profile_setting.dart';
import '../../../data/settings/log_in_info_setting.dart';
import '../../../data/tasks/get_remote_self_profile_task.dart';
import '../../views/log_in/log_in_route.dart';

class OnInitReaction extends Reaction<void> {

  final SelfProfileRepository _selfProfileRepository;
  final SelfProfileSetting _selfProfileSetting;
  final LogInInfoSetting _logInInfoSetting;
  final IsNetworkAvailableBox _isNetworkAvailableBox;
  final GetRemoteSelfProfileTask _getRemoteSelfProfileTask;
  final LogInRoute _logInRoute;

  OnInitReaction(
      this._selfProfileRepository,
      this._selfProfileSetting,
      this._logInInfoSetting,
      this._isNetworkAvailableBox,
      this._getRemoteSelfProfileTask,
      this._logInRoute
  );

  @override
  void excite(void arg) async {
    final cachedSelfProfile = await _selfProfileSetting.get();
    if (cachedSelfProfile != null) {
      _selfProfileRepository.data = cachedSelfProfile;
      // TODO: ContactListRoute
      await _getRemoteSelfProfileTask.execute(null);
      return null;
    }

    final cachedUid = await _logInInfoSetting.get();
    if (cachedUid == null) {
      _logInRoute.follow(null);
      return null;
    }

    final isNetworkAvailable = await _isNetworkAvailableBox.get();
    if (!isNetworkAvailable) {
      // TODO: no net error
      return null;
    }

    final profile = _getRemoteSelfProfileTask.execute(null);
    if (profile != null) {
      // TODO: ContactListRoute
    } else {
      // TODO: ProfileEditorRoute
    }
  }
}
