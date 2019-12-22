import '../../../../flutter_utils/architecture/presentation/view/view_state.dart';
import '../../../../flutter_utils/architecture/presentation/view/widget_model.dart';

class LogInModel extends WidgetModel {

  bool isLoading = false;
  String phone = "";
  String smsCode = "";
  String verificationId;

  bool get isPhoneSubmitted => verificationId != null;

  LogInModel(ViewState viewState) : super(viewState);
}
