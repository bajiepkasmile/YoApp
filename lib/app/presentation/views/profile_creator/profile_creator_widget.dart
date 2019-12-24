import 'package:flutter/material.dart';

import '../../../../architecture/presentation/navigation/route_bundle.dart';
import '../../../../flutter_utils/architecture/presentation/scope/scope_bundle.dart';
import '../../../../flutter_utils/architecture/presentation/view/view_widget.dart';
import '../../../../flutter_utils/architecture/presentation/view/widget_model_bundle.dart';
import '../../app/yo_app_scope.dart';
import 'profile_creator_model.dart';
import 'profile_creator_scope.dart';

class ProfileCreatorWidget extends ViewWidget<YoAppScope, ProfileCreatorScope, void, void, ProfileCreatorModel> {

  ProfileCreatorWidget(RouteBundle<YoAppScope, String, void> routeBundle) : super(routeBundle);

  @override
  ProfileCreatorScope createScope(ScopeBundle<YoAppScope, void, void, ProfileCreatorModel> bundle) =>
      ProfileCreatorScope(bundle);

  @override
  ProfileCreatorModel createViewModel(WidgetModelBundle<void> bundle) => ProfileCreatorModel(bundle);

  Widget build() => Material(child: _buildCenteredBody());

  Widget _buildCenteredBody() =>
      Center(
          child: Container(
            margin: EdgeInsets.only(left: 32, right: 32),
            width: double.infinity,
            child: Column(mainAxisSize: MainAxisSize.min, children: _buildBody()),
          )
      );

  List<Widget> _buildBody() {
    if (model.isLoading) {
      return [CircularProgressIndicator()];
    } else {
      return _buildContent();
    }
  }

  List<Widget> _buildContent() =>
      [
        _buildNameField(),
        SizedBox(height: 20),
        _buildContinueBtn()
      ];

  Widget _buildNameField() =>
      TextField(
        keyboardType: TextInputType.text,
        style: TextStyle(fontSize: 18),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(16),
            hintText: "Yo name",
            border: OutlineInputBorder()
        ),
        onChanged: (text) => scope.onNameChangedReaction.excite(text),
        onSubmitted: (text) => scope.onNameSubmittedReaction.excite(null),
      );

  Widget _buildContinueBtn() =>
      SizedBox(
          width: double.infinity,
          child: RaisedButton(
            child: Text("Continue", style: TextStyle(color: Colors.white, fontSize: 16)),
            padding: EdgeInsets.only(top: 12, bottom: 12),
            color: Colors.grey,
            elevation: 4,
            onPressed: () => scope.onNameSubmittedReaction.excite(null),
          )
      );
}
