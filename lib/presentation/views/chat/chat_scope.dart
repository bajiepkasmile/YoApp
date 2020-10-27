import 'package:flutter_utils/architecture/presentation/reaction/simple_on_back_reaction.dart';
import 'package:flutter_utils/architecture/presentation/scope/scope_bundle.dart';
import 'package:flutter_utils/architecture/presentation/scope/widget_scope.dart';
import 'package:yo_app/models/chat.dart';
import 'package:yo_app/presentation/app/yo_app_scope.dart';
import 'package:yo_app/presentation/views/chat/chat_model.dart';

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
