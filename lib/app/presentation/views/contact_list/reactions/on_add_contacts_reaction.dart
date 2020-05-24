import '../../../../../architecture/presentation/reaction/reaction.dart';
import '../../../../data/tasks/contacts/get_phone_contacts_task.dart';
import '../../../../models/input_status.dart';
import '../../../funcs/request_contacts_permission_func.dart';
import '../contact_list_model.dart';

class OnAddContactsReaction extends Reaction<void> {

  final RequestContactsPermissionFunc _requestContactsPermissionFunc;
  final GetPhoneContactsWithChatsTask _getPhoneContactsWithChatsTask;
  final ContactListModel _model;

  OnAddContactsReaction(this._requestContactsPermissionFunc, this._getPhoneContactsWithChatsTask, this._model);

  @override
  void excite(void arg) async {
    final isGranted = await _requestContactsPermissionFunc.call(null);

    if (!isGranted) {
      return;
    }

    _model.status = InputStatus.loading;
    _model.refresh();

    //TODO:
//    final contactsWithChats = await _getPhoneContactsWithChatsTask.execute(null);
//    _model.status = InputStatus.complete;
//    _model.refresh();
  }
}
