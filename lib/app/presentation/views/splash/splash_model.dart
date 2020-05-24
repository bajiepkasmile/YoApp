import '../../../../flutter_utils/architecture/presentation/view/widget_model.dart';
import '../../../../flutter_utils/architecture/presentation/view/widget_model_bundle.dart';
import '../../../models/input_status.dart';

class SplashModel extends WidgetModel {

  var status = InputStatus.loading;

  SplashModel(WidgetModelBundle bundle) : super(bundle);
}
