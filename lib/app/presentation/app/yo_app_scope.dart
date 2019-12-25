import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../connectivity_utils/architecture/data/box/is_network_available_box.dart';
import '../../../flutter_utils/architecture/presentation/scope/app_scope.dart';
import '../../../flutter_utils/architecture/presentation/scope/scope_bundle.dart';
import '../../../architecture/presentation/view/view_model.dart';
import '../../data/emitters/on_receive_message_emitter.dart';
import '../../data/operations/tools/firestore/message/firestore_message_mapper.dart';
import '../../data/operations/implementation/auth/verify_phone_operation.dart';
import '../../data/operations/implementation/messages/get_remote_messages_operation.dart';
import '../../data/operations/implementation/messages/send_message_operation.dart';
import '../../data/operations/implementation/profiles/create_profile_operation.dart';
import '../../data/repositories/self_profile_repository.dart';
import '../../data/operations/implementation/auth/log_in_operation.dart';
import '../../data/operations/implementation/profiles/get_remote_profile_operation.dart';
import '../../data/operations/tools/firestore/firestore_entry.dart';
import '../../data/operations/tools/firestore/profile/firestore_profile_mapper.dart';
import '../../data/tasks/profiles/get_remote_self_profile_task.dart';
import '../../data/tasks/profiles/create_self_profile_task.dart';
import '../../data/tasks/auth/log_in_task.dart';
import '../../data/tasks/messages/get_remote_messages_task.dart';
import '../../data/tasks/messages/send_message_task.dart';
import '../../data/settings/self_profile_setting.dart';
import '../../data/settings/log_in_info_setting.dart';
import '../views/log_in/log_in_route.dart';
import '../views/profile_creator/profile_creator_route.dart';
import 'reactions/on_init_reaction.dart';

class YoAppScope extends AppScope<YoAppScope> {

  FirebaseAuth firebaseAuth;
  Firestore firestore;
  Connectivity connectivity;
  Future<SharedPreferences> prefsFuture;

  SelfProfileRepository selfProfileRepository;

  SelfProfileSetting selfProfileSetting;
  LogInInfoSetting logInInfoSetting;

  IsNetworkAvailableBox isNetworkAvailableBox;

  FirestoreEntry firestoreEntry;
  FirestoreProfileMapper firestoreProfileMapper;
  FirestoreMessageMapper firestoreMessageMapper;

  OnReceiveMessageEmitter onReceiveMessageEmitter;

  VerifyPhoneOperation verifyPhoneOperation;
  LogInOperation logInOperation;
  CreateProfileOperation createProfileOperation;
  GetRemoteProfileOperation getRemoteProfileOperation;
  GetRemoteMessagesOperation getRemoteMessagesOperation;
  SendMessageOperation sendMessageOperation;

  LogInTask logInTask;
  CreateSelfProfileTask createSelfProfileTask;
  GetRemoteSelfProfileTask getRemoteSelfProfileTask;
  GetRemoteMessagesTask getRemoteMessagesTask;
  SendMessageTask sendMessageTask;

  LogInRoute logInRoute;
  ProfileCreatorRoute profileCreatorRoute;

  OnInitReaction onInitReaction;

  YoAppScope(ScopeBundle<YoAppScope, void, void, ViewModel> bundle) : super(bundle) {
    firebaseAuth = FirebaseAuth.instance;
    firestore = Firestore.instance;
    connectivity = Connectivity();
    prefsFuture = SharedPreferences.getInstance();

    selfProfileRepository = SelfProfileRepository();

    selfProfileSetting = SelfProfileSetting(prefsFuture);
    logInInfoSetting = LogInInfoSetting(prefsFuture);

    isNetworkAvailableBox = IsNetworkAvailableBox(connectivity);

    firestoreEntry = FirestoreEntry(firestore);
    firestoreProfileMapper = FirestoreProfileMapper();
    firestoreMessageMapper = FirestoreMessageMapper(selfProfileRepository);

    onReceiveMessageEmitter = OnReceiveMessageEmitter(firestoreEntry, firestoreMessageMapper, selfProfileRepository);

    verifyPhoneOperation = VerifyPhoneOperation(firebaseAuth);
    logInOperation = LogInOperation(firebaseAuth);
    createProfileOperation = CreateProfileOperation(firestoreEntry, firestoreProfileMapper);
    getRemoteProfileOperation = GetRemoteProfileOperation(
        firestoreEntry,
        firestoreProfileMapper
    );
    getRemoteMessagesOperation = GetRemoteMessagesOperation(firestoreEntry, firestoreMessageMapper);
    sendMessageOperation = SendMessageOperation(firestoreEntry, firestoreMessageMapper);

    logInTask = LogInTask(logInOperation, logInInfoSetting);
    createSelfProfileTask = CreateSelfProfileTask(
        createProfileOperation,
        logInInfoSetting,
        selfProfileSetting,
        selfProfileRepository
    );
    getRemoteSelfProfileTask = GetRemoteSelfProfileTask(
        getRemoteProfileOperation,
        logInInfoSetting,
        selfProfileSetting,
        selfProfileRepository
    );
    getRemoteMessagesTask = GetRemoteMessagesTask(getRemoteMessagesOperation, selfProfileRepository);
    sendMessageTask = SendMessageTask(sendMessageOperation, selfProfileRepository);

    logInRoute = LogInRoute(context, this, screenContainer);
    profileCreatorRoute = ProfileCreatorRoute(context, this, screenContainer);

    onInitReaction = OnInitReaction(
        selfProfileRepository,
        selfProfileSetting,
        logInInfoSetting,
        isNetworkAvailableBox,
        getRemoteSelfProfileTask,
        logInRoute,
        profileCreatorRoute
    );
  }
}
