import '../../../../../architecture/data/operation/operation.dart';

class LogOutOperation extends Operation<void, void> {

  @override
  Future<void> execute(void arg) => Future.delayed(Duration(seconds: 5));
}
