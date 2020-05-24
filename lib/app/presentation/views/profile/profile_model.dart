import '../../../../flutter_utils/architecture/presentation/view/widget_model.dart';
import '../../../../flutter_utils/architecture/presentation/view/widget_model_bundle.dart';
import '../../../models/profile.dart';

class ProfileModel extends WidgetModel<void> {

  Profile profile;

  ProfileModel(WidgetModelBundle<void> bundle) : super(bundle);
}
