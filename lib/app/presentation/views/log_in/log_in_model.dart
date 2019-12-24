import '../../../../flutter_utils/architecture/presentation/view/widget_model_bundle.dart';
import '../../../../flutter_utils/architecture/presentation/view/widget_model.dart';

class LogInModel extends WidgetModel<void> {

  bool isLoading = false;
  String phone = "";
  String smsCode = "";
  String verificationId;

  bool get isPhoneSubmitted => verificationId != null;

  LogInModel(WidgetModelBundle<void> bundle) : super(bundle);
}
