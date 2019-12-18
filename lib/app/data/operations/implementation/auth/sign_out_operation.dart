import '../../../../../architecture/data/operation/operation.dart';

class SignOutOperation extends Operation<void, void> {

  @override
  Future<void> execute(void arg) => Future.delayed(Duration(seconds: 5));
}
