import '../../../../flutter_utils/architecture/presentation/view/widget_model.dart';
import '../../../../flutter_utils/architecture/presentation/view/widget_model_bundle.dart';
import 'models/main_tab_type.dart';

class MainModel extends WidgetModel<void> {

  MainTabType tabType = MainTabType.contactList;

  MainModel(WidgetModelBundle<void> bundle) : super(bundle);
}
