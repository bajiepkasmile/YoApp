import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:phone_number/phone_number.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yo_app/app/presentation/views/chat_list/chat_list_route.dart';
import 'package:yo_app/app/presentation/views/contact/contact_route.dart';

import 'package:yo_app/app/presentation/views/contact_list/contact_list_route.dart';

import '../../../connectivity_utils/architecture/data/emitter/on_connectivity_changed_emitter.dart';
import '../../../connectivity_utils/architecture/data/func/is_network_available_func.dart';
import '../../../flutter_utils/architecture/presentation/scope/app_scope.dart';
import '../../../flutter_utils/architecture/presentation/scope/scope_bundle.dart';
import '../../../architecture/presentation/view/view_model.dart';
import '../../data/funcs/requests/auth/verify_phone_request.dart';
import '../../data/funcs/requests/profiles/create_profile_request.dart';
import '../../data/funcs/requests/auth/log_in_request.dart';
import '../../data/funcs/requests/profiles/get_profile_request.dart';
import '../../data/repositories/profile_box.dart';
import '../../tools/firestore/message/firestore_message_mapper.dart';
import '../../tools/firestore/firestore_entry.dart';
import '../../tools/firestore/profile/firestore_profile_mapper.dart';
import '../../data/tasks/profiles/get_profile_task.dart';
import '../../data/tasks/profiles/create_profile_task.dart';
import '../../data/tasks/auth/log_in_task.dart';
import '../../data/tasks/auth/log_out_task.dart';
import '../../data/tasks/contacts/add_contact_task.dart';
import '../../data/tasks/profiles/change_avatar_task.dart';
import '../../data/settings/profile_setting.dart';
import '../../data/settings/log_in_info_setting.dart';
import '../../data/funcs/requests/auth/log_out_request.dart';
import '../../data/repositories/contacts_box.dart';
import '../../data/tasks/contacts/get_phone_contacts_task.dart';
import '../views/splash/splash_route.dart';
import '../utils/phone_formatter.dart';
import 'reactions/on_init_reaction.dart';

class YoAppScope extends AppScope<YoAppScope> {

  FirebaseAuth firebaseAuth;
  Firestore firestore;
  Connectivity connectivity;
  Future<SharedPreferences> prefsFuture;
  PhoneNumber phoneNumber;

  PhoneFormatter phoneFormatter;

  ProfileBox profileRepository;
  ContactsBox contactsRepository;

  ProfileSetting profileSetting;
  LogInInfoSetting logInInfoSetting;

  IsNetworkAvailableFunc isNetworkAvailableFunc;

  FirestoreEntry firestoreEntry;
  FirestoreProfileMapper firestoreProfileMapper;
  FirestoreMessageMapper firestoreMessageMapper;

  OnConnectivityChangedEmitter onConnectivityChangedEmitter;

  VerifyPhoneRequest verifyPhoneRequest;
  LogInRequest logInRequest;
  CreateProfileRequest createProfileRequest;
  GetProfileRequest getProfileRequest;
  LogOutRequest logOutRequest;

  LogInTask logInTask;
  CreateProfileTask createProfileTask;
  GetProfileTask getProfileTask;
  AddContactTask addContactTask;
  ChangeAvatarTask changeAvatarTask;
  GetPhoneContactsWithChatsTask getPhoneContactsWithChatsTask;
  LogOutTask logOutTask;

  SplashRoute splashRoute;

  OnInitReaction onInitReaction;

  YoAppScope(ScopeBundle<YoAppScope, ViewModel, void, void> bundle) : super(bundle) {
    firebaseAuth = FirebaseAuth.instance;
    firestore = Firestore.instance;
    connectivity = Connectivity();
    prefsFuture = SharedPreferences.getInstance();
    phoneNumber = PhoneNumber();

    phoneFormatter = PhoneFormatter(phoneNumber);

    profileRepository = ProfileBox();
    contactsRepository = ContactsBox();

    profileSetting = ProfileSetting(prefsFuture);
    logInInfoSetting = LogInInfoSetting(prefsFuture);

    isNetworkAvailableFunc = IsNetworkAvailableFunc(connectivity);

    firestoreEntry = FirestoreEntry(firestore);
    firestoreProfileMapper = FirestoreProfileMapper();
    firestoreMessageMapper = FirestoreMessageMapper(profileRepository);

    onConnectivityChangedEmitter = OnConnectivityChangedEmitter(connectivity);

    verifyPhoneRequest = VerifyPhoneRequest(firebaseAuth);
    logInRequest = LogInRequest(firebaseAuth);
    createProfileRequest = CreateProfileRequest(firestoreEntry, firestoreProfileMapper);
    getProfileRequest = GetProfileRequest(
        firestoreEntry,
        firestoreProfileMapper
    );

    logInTask = LogInTask(logInRequest, logInInfoSetting);
    createProfileTask = CreateProfileTask(
        createProfileRequest,
        logInInfoSetting,
        profileSetting,
        profileRepository
    );
    getProfileTask = GetProfileTask(
        getProfileRequest,
        logInInfoSetting,
        profileSetting,
        profileRepository
    );
    addContactTask = AddContactTask();
    changeAvatarTask = ChangeAvatarTask();
    getPhoneContactsWithChatsTask = GetPhoneContactsWithChatsTask();
    logOutTask = LogOutTask(logOutRequest, profileSetting, logInInfoSetting);

    splashRoute = SplashRoute(this, queueTarget);

    final s = ContactRoute(this, queueTarget);
    onInitReaction = OnInitReaction(s);
  }
}
