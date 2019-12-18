import 'package:flutter/material.dart';

import '../../../data/operations/tools/mock/mock_data.dart';
import '../../../model/message.dart';

class ChatWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: _buildAppBar(),
    floatingActionButton: _buildFab(),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    body: _buildBody(),
  );

  Widget _buildAppBar() => AppBar(
    title: Text("Some Name", style: TextStyle(color: Colors.white),),
    leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.white), onPressed: () => {}),
    elevation: 8,
  );

  Widget _buildFab() => FloatingActionButton(
    child: Text("Yo", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
    backgroundColor: Colors.grey,
    elevation: 4,
    onPressed: () => {},
  );

  Widget _buildBody() {
    if (true) {
      return _buildLoading();
    } else if (true) {
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
    final messageWidgets = MockData.messages.map(_buildMessage).toList();

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

  Widget _buildParametrizedMessage(Message message, Color backgroundColor, MainAxisAlignment alignment) =>
      Row(
        children: [_buildMessageCard(message, backgroundColor)],
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: alignment,
      );

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
