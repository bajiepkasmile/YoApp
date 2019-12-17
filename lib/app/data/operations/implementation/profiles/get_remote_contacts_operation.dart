import '../../../../../architecture/data/operation/operation.dart';
import '../../../../model/profile.dart';
import '../../tools/mock/mock_data.dart';

class GetRemoteContactsOperation extends Operation<void, List<Profile>> {

  @override
  Future<List<Profile>> execute(void arg) => Future.delayed(Duration(seconds: 2), () => MockData.contacts);
}
