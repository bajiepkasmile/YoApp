import 'package:image_picker/image_picker.dart';

import '../../../../flutter_utils/architecture/presentation/reaction/simple_on_back_reaction.dart';
import '../../../../flutter_utils/architecture/presentation/scope/scope_bundle.dart';
import '../../../../flutter_utils/architecture/presentation/scope/widget_scope.dart';
import '../../../../flutter_utils/architecture/presentation/view/widget_model.dart';
import '../../app/yo_app_scope.dart';

class ImageSourceScope extends WidgetScope<YoAppScope, WidgetModel, void, ImageSource> {

  SimpleOnBackReaction<ImageSource> onBackReaction;

  ImageSourceScope(ScopeBundle<YoAppScope, WidgetModel, void, ImageSource> bundle) : super(bundle) {
    onBackReaction = SimpleOnBackReaction(trace);
  }
}
