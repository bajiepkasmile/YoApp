import '../../../../flutter_utils/architecture/presentation/view/widget_model.dart';
import '../../../../flutter_utils/architecture/presentation/view/widget_model_bundle.dart';
import '../../../models/input_status.dart';

class PhoneInputModel extends WidgetModel {

  String phone;
  InputStatus status = InputStatus.inactive;

  PhoneInputModel(WidgetModelBundle bundle) : super(bundle);
}
