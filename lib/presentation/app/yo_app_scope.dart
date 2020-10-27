import 'package:architecture/presentation/view/view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:connectivity_utils/architecture/data/emitter/on_connectivity_changed_emitter.dart';
import 'package:connectivity_utils/architecture/data/func/is_network_available_func.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_utils/architecture/presentation/reaction/simple_on_open_reaction.dart';
import 'package:flutter_utils/architecture/presentation/scope/app_scope.dart';
import 'package:flutter_utils/architecture/presentation/scope/scope_bundle.dart';
import 'package:phone_number/phone_number.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yo_app/data/boxes/contacts_box.dart';
import 'package:yo_app/data/boxes/profile_box.dart';
import 'package:yo_app/data/funcs/remote/auth/log_in_func.dart';
import 'package:yo_app/data/funcs/remote/auth/log_out_func.dart';
import 'package:yo_app/data/funcs/remote/auth/verify_phone_func.dart';
import 'package:yo_app/data/settings/log_in_info_setting.dart';
import 'package:yo_app/data/settings/profile_general_info_setting.dart';
import 'package:yo_app/data/tasks/auth/log_in_task.dart';
import 'package:yo_app/data/tasks/auth/log_out_task.dart';
import 'package:yo_app/data/tasks/contacts/add_contact_task.dart';
import 'package:yo_app/data/tasks/profiles/create_profile_task.dart';
import 'package:yo_app/data/tasks/profiles/get_profile_task.dart';
import 'package:yo_app/data/tasks/profiles/set_avatar_task.dart';
import 'package:yo_app/presentation/app/reactions/on_connectivity_changed_reaction.dart';
import 'package:yo_app/presentation/utils/phone_formatter.dart';
import 'package:yo_app/presentation/views/splash/splash_route.dart';
import 'package:yo_app/tools/firestore/firestore_entry.dart';
import 'package:yo_app/tools/firestore/profile/firestore_profile_mapper.dart';

class YoAppScope extends AppScope<YoAppScope> {

  FirebaseAuth firebaseAuth;
  Firestore firestore;
  Connectivity connectivity;
  Future<SharedPreferences> prefsFuture;
  PhoneNumber phoneNumber;

  PhoneFormatter phoneFormatter;

  ProfileBox profileBox;
  ContactsBox contactsBox;

  ProfileGeneralInfoSetting profileGeneralInfoSetting;
  LogInInfoSetting logInInfoSetting;

  IsNetworkAvailableFunc isNetworkAvailableFunc;

  FirestoreEntry firestoreEntry;
  FirestoreProfileGeneralInfoMapper firestoreProfileGeneralInfoMapper;

  OnConnectivityChangedEmitter onConnectivityChangedEmitter;

  VerifyPhoneFunc verifyPhoneFunc;
  LogInFunc logInFunc;
  LogOutFunc logOutFunc;

  LogInTask logInTask;
  LogOutTask logOutTask;
  CreateProfileTask createProfileTask;
  GetProfileTask getProfileTask;
  AddContactTask addContactTask;
  SetAvatarTask setAvatarTask;

  SplashRoute splashRoute;

  SimpleOnOpenReaction onInitReaction;
  OnConnectivityChangedReaction onConnectivityChangedReaction;

  YoAppScope(ScopeBundle<YoAppScope, ViewModel, void, void> bundle) : super(bundle) {
    firebaseAuth = FirebaseAuth.instance;
    firestore = Firestore.instance;
    connectivity = Connectivity();
    prefsFuture = SharedPreferences.getInstance();
    phoneNumber = PhoneNumber();

    phoneFormatter = PhoneFormatter(phoneNumber);

    profileBox = ProfileBox();
    contactsBox = ContactsBox();

    profileGeneralInfoSetting = ProfileGeneralInfoSetting(prefsFuture);
    logInInfoSetting = LogInInfoSetting(prefsFuture);

    isNetworkAvailableFunc = IsNetworkAvailableFunc(connectivity);

    firestoreEntry = FirestoreEntry(firestore);

    onConnectivityChangedEmitter = OnConnectivityChangedEmitter(connectivity);
  }

  @override
  void onConfigure() {
    onConnectivityChangedEmitter.addReaction(onConnectivityChangedReaction);
  }
}
