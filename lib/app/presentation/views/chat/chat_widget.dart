import 'package:flutter/material.dart';

import '../../../../architecture/presentation/navigation/route_bundle.dart';
import '../../../../implemented_architecture/presentation/scope/scope_bundle.dart';
import '../../../../implemented_architecture/presentation/view/view_state.dart';
import '../../../../implemented_architecture/presentation/view/view_widget.dart';
import '../../../model/profile.dart';
import '../../../model/message.dart';
import '../../../model/message_status.dart';
import '../../app/yo_app_scope.dart';
import 'chat_model.dart';
import 'chat_scope.dart';

class ChatWidget extends ViewWidget<YoAppScope, ChatScope, Profile, void, ChatModel> {

  ChatWidget(RouteBundle<YoAppScope, Profile, void> routeBundle) : super(routeBundle);

  @override
  ChatScope createScope(ScopeBundle<YoAppScope, Profile, void, ChatModel> bundle) => ChatScope(bundle);

  @override
  ChatModel createViewModel(ViewState state, Profile arg) => ChatModel(state, arg);

  @override
  void onInit() => scope.onInitReaction.excite(null);

  @override
  Widget build() => Scaffold(
    appBar: _buildAppBar(),
    floatingActionButton: _buildFab(),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    body: _buildBody(),
  );

  Widget _buildAppBar() => AppBar(
    title: Text(model.contact.fullName, style: TextStyle(color: Colors.white),),
    leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => scope.onBackReaction.excite(null)
    ),
    elevation: 8,
  );

  Widget _buildFab() => FloatingActionButton(
    child: Text("Yo", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
    backgroundColor: Colors.grey,
    elevation: 4,
    onPressed: () => scope.onSendMessageReaction.excite(null),
  );

  Widget _buildBody() {
    if (model.messages == null) {
      return _buildLoading();
    } else if (model.messages.isEmpty) {
      return _buildEmpty();
    } else {
      return _buildMessages();
    }
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());

  Widget _buildEmpty() =>
      Center(
          child: Column(
            children: [
              Icon(Icons.message, color: Colors.grey, size: 40,),
              SizedBox(height: 8,),
              Text("No Yo's yet", style: TextStyle(color: Colors.grey, fontSize: 18))
            ],
            mainAxisSize: MainAxisSize.min,)
      );

  Widget _buildMessages() {
    final bodyWidgets = <Widget>[];
    final messageWidgets = model.messages.map(_buildMessage).toList();

    bodyWidgets.add(Divider(height: 80, color: Colors.transparent));
    bodyWidgets.addAll(messageWidgets);
    bodyWidgets.add(Divider(height: 0, color: Colors.transparent));

    return ListView.separated(
      itemCount: bodyWidgets.length,
      itemBuilder: (context, index) => bodyWidgets[index],
      separatorBuilder: (context, index) => Divider(height: 8, color: Colors.transparent),
      reverse: true,
    );
  }

  Widget _buildMessage(Message message) {
    if (message.isOwner) {
      return _buildOutMessage(message);
    } else {
      return _buildInMessage(message);
    }
  }

  Widget _buildInMessage(Message message) => _buildParametrizedMessage(message, Colors.white, MainAxisAlignment.start);

  Widget _buildOutMessage(Message message) => _buildParametrizedMessage(message, Colors.black12, MainAxisAlignment.end);

  Widget _buildParametrizedMessage(Message message, Color backgroundColor, MainAxisAlignment alignment) {
    final rowWidgets = <Widget>[];

    if (message.status == MessageStatus.sending) {
      rowWidgets.add(Icon(Icons.access_time, color: Colors.grey));
    }

    if (message.status == MessageStatus.failed) {
      rowWidgets.add(Icon(Icons.error_outline, color: Colors.redAccent));
    }

    rowWidgets.add(_buildMessageCard(message, backgroundColor));

    return Row(
      children: rowWidgets,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: alignment,
    );
  }

  Widget _buildMessageCard(Message message, Color backgroundColor) =>
      Card(
        child: _buildMessageContainer(message, backgroundColor),
        elevation: 2,
        margin: EdgeInsets.only(left: 12, right: 12), clipBehavior: Clip.antiAliasWithSaveLayer,
      );

  Widget _buildMessageContainer(Message message, Color backgroundColor) =>
      Container(
        child: Text(message.text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
        color: backgroundColor,
      );
}
