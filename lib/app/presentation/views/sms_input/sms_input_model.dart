import '../../../../flutter_utils/architecture/presentation/view/widget_model.dart';
import '../../../../flutter_utils/architecture/presentation/view/widget_model_bundle.dart';
import '../../../models/input_status.dart';
import 'sms_input_arg.dart';

class SmsInputModel extends WidgetModel<SmsInputArg> {

  String smsCode = "";
  int secondsLeft = 60;
  InputStatus status = InputStatus.active;
  String verificationId;

  bool get hasError => status == InputStatus.error;
  bool get canSendSms => secondsLeft <= 0;

  SmsInputModel(WidgetModelBundle<SmsInputArg> bundle) :
        verificationId = bundle.arg.verificationId,
        super(bundle);
}
