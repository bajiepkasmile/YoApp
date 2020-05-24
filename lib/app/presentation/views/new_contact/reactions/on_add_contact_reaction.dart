import '../../../../../architecture/presentation/navigation/route_trace.dart';
import '../../../../../connectivity_utils/architecture/data/func/is_network_available_func.dart';
import '../../../../../architecture/presentation/reaction/reaction.dart';
import '../../../../data/tasks/contacts/add_contact_task.dart';
import '../../../../models/input_status.dart';
import '../../new_contact/new_contact_model.dart';

class OnAddContactReaction extends Reaction<void> {

  final IsNetworkAvailableFunc _isNetworkAvailableFunc;
  final AddContactTask _addContactTask;
  final RouteTrace<void> _trace;
  final NewContactModel _model;

  OnAddContactReaction(this._isNetworkAvailableFunc, this._addContactTask, this._trace, this._model);

  @override
  void excite(void arg) async {
    final isNetworkAvailable = await _isNetworkAvailableFunc.call(null);
    if (!isNetworkAvailable) {
      _refreshWithError();
      return;
    }

    _model.status = InputStatus.loading;
    _model.refresh();

    try {
      _model.contact = await _addContactTask.execute(_model.phone);
      if (_model.contact.isInApp) {
        _trace.pop(null);
      } else {
        _model.lastSearchedPhone = _model.phone;
        _model.status = InputStatus.active;
        _model.refresh();
      }
    } catch(e) {
      _refreshWithError();
    }
  }

  void _refreshWithError() {
    _model.status = InputStatus.error;
    _model.refresh();
  }
}
