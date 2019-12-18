import '../../../../implemented_architecture/presentation/view/view_state.dart';
import '../../../../implemented_architecture/presentation/view/widget_model.dart';

class LogInModel extends WidgetModel {

  bool isLoading = false;
  bool isPhoneSubmitted = false;
  String phone = "";
  String smsCode = "";

  LogInModel(ViewState viewState) : super(viewState);
}
