import '../../../../../architecture/data/operation/operation.dart';

class SignInOperation extends Operation<String, void> {
  
  @override
  Future<void> execute(String phone) => Future.delayed(Duration(seconds: 2));
}
