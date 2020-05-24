import 'package:yo_app/app/models/chat.dart';

import '../../../../flutter_utils/architecture/presentation/reaction/simple_on_back_reaction.dart';
import '../../../../flutter_utils/architecture/presentation/scope/scope_bundle.dart';
import '../../../../flutter_utils/architecture/presentation/scope/widget_scope.dart';
import '../../../models/profile.dart';
import '../../app/yo_app_scope.dart';
import 'chat_model.dart';

class ChatScope extends WidgetScope<YoAppScope, ChatModel, Chat, void> {

  SimpleOnBackReaction onBackReaction;

  ChatScope(ScopeBundle<YoAppScope, ChatModel, Chat, void> bundle) : super(bundle) {
    onBackReaction = SimpleOnBackReaction(trace);
  }

  @override
  void onConfigure() {
  }

  @override
  void onDeconfigure() {
  }
}
