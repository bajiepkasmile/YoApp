import '../../../../../architecture/data/operation/operation.dart';
import '../../../../model/profile.dart';
import '../../tools/mock/mock_data.dart';

class ConfirmSignInOperation extends Operation<String, Profile> {

  @override
  Future<Profile> execute(String smsCode) => Future.delayed(Duration(seconds: 5), () => MockData.selfProfile);
}
