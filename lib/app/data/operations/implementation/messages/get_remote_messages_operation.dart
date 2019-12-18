import '../../../../../architecture/data/operation/operation.dart';
import '../../../../model/message.dart';
import '../../tools/mock/mock_data.dart';

class GetRemoteMessagesOperation extends Operation<String, List<Message>> {

  @override
  Future<List<Message>> execute(String contactId) => Future.delayed(Duration(seconds: 5), () => MockData.messages);
}
