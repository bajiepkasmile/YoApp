import '../../../../flutter_utils/architecture/presentation/view/widget_model_bundle.dart';
import '../../../../flutter_utils/architecture/presentation/view/widget_model.dart';

class ProfileCreatorModel extends WidgetModel<void> {

  String name;
  bool isLoading;

  ProfileCreatorModel(WidgetModelBundle<void> bundle) : super(bundle);
}
