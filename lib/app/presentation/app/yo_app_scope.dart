import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../connectivity_utils/architecture/data/box/is_network_available_box.dart';
import '../../../flutter_utils/architecture/presentation/scope/app_scope.dart';
import '../../../flutter_utils/architecture/presentation/scope/scope_bundle.dart';
import '../../../architecture/presentation/view/view_model.dart';
import '../../data/operations/implementation/auth/verify_phone_operation.dart';
import '../../data/operations/implementation/messages/get_remote_messages_operation.dart';
import '../../data/operations/implementation/messages/send_message_operation.dart';
import '../../data/repositories/self_profile_repository.dart';
import '../../data/operations/implementation/auth/log_in_operation.dart';
import '../../data/operations/implementation/profiles/get_remote_self_profile_operation.dart';
import '../../data/operations/tools/firestore/firestore_entry.dart';
import '../../data/operations/tools/firestore/profile/firestore_profile_mapper.dart';
import '../../data/tasks/get_remote_self_profile_task.dart';
import '../../data/tasks/log_in_task.dart';
import '../../data/settings/self_profile_setting.dart';
import '../../data/settings/uid_setting.dart';
import '../views/log_in/log_in_route.dart';
import 'reactions/on_init_reaction.dart';

class YoAppScope extends AppScope<YoAppScope> {

  FirebaseAuth firebaseAuth;
  Firestore firestore;
  Connectivity connectivity;
  Future<SharedPreferences> prefsFuture;

  FirestoreEntry firestoreEntry;
  FirestoreProfileMapper firestoreProfileMapper;

  VerifyPhoneOperation verifyPhoneOperation;
  LogInOperation logInOperation;
  GetRemoteSelfProfileOperation getRemoteSelfProfileOperation;
  GetRemoteMessagesOperation getRemoteMessagesOperation;
  SendMessageOperation sendMessageOperation;

  LogInTask logInTask;
  GetRemoteSelfProfileTask getRemoteSelfProfileTask;

  SelfProfileRepository selfProfileRepository;

  SelfProfileSetting selfProfileSetting;
  UidSetting uidSetting;

  IsNetworkAvailableBox isNetworkAvailableBox;

  LogInRoute logInRoute;

  OnInitReaction onInitReaction;

  YoAppScope(ScopeBundle<YoAppScope, void, void, ViewModel> bundle) : super(bundle) {
    firebaseAuth = FirebaseAuth.instance;
    firestore = Firestore.instance;
    connectivity = Connectivity();
    prefsFuture = SharedPreferences.getInstance();

    firestoreEntry = FirestoreEntry(firestore);
    firestoreProfileMapper = FirestoreProfileMapper();

    verifyPhoneOperation = VerifyPhoneOperation(firebaseAuth);
    logInOperation = LogInOperation(firebaseAuth);
    getRemoteSelfProfileOperation = GetRemoteSelfProfileOperation(firestoreEntry, uidSetting, firestoreProfileMapper);
    getRemoteMessagesOperation = GetRemoteMessagesOperation();
    sendMessageOperation = SendMessageOperation();

    logInTask = LogInTask(logInOperation, uidSetting);
    getRemoteSelfProfileTask = GetRemoteSelfProfileTask(
        getRemoteSelfProfileOperation,
        selfProfileSetting,
        selfProfileRepository
    );

    selfProfileRepository = SelfProfileRepository();

    selfProfileSetting = SelfProfileSetting(prefsFuture);
    uidSetting = UidSetting(prefsFuture);

    isNetworkAvailableBox = IsNetworkAvailableBox(connectivity);

    logInRoute = LogInRoute(context, this, screenContainer);

    onInitReaction = OnInitReaction(
        selfProfileRepository,
        selfProfileSetting,
        uidSetting,
        isNetworkAvailableBox,
        getRemoteSelfProfileTask,
        logInRoute
    );
  }
}
