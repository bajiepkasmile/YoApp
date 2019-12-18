import '../../../../../architecture/data/operation/operation.dart';

class LogInOperation extends Operation<String, void> {
  
  @override
  Future<void> execute(String phone) => Future.delayed(Duration(seconds: 5));
}
