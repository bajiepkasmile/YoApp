import 'dart:io';

import 'package:architecture/presentation/navigation/route_bundle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_utils/architecture/presentation/scope/scope_bundle.dart';
import 'package:flutter_utils/architecture/presentation/view/widget_model.dart';
import 'package:flutter_utils/architecture/presentation/view/widget_model_bundle.dart';
import 'package:flutter_utils/architecture/presentation/view/widget_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yo_app/presentation/app/yo_app_scope.dart';
import 'package:yo_app/presentation/views/image_source/image_source_scope.dart';

class ImageSourceState extends WidgetState<YoAppScope, ImageSourceScope, WidgetModel, void, ImageSource> {

  ImageSourceState(RouteBundle<YoAppScope, void, ImageSource> routeBundle) : super(routeBundle);

  @override
  ImageSourceScope createScope(ScopeBundle<YoAppScope, WidgetModel, void, ImageSource> bundle) =>
      ImageSourceScope(bundle);

  @override
  WidgetModel createViewModel(WidgetModelBundle<void> bundle) => WidgetModel(bundle);

  @override
  Widget build(BuildContext context) => Platform.isIOS ? _buildForIos() : _buildForOthers();

  Widget _buildForIos() =>
      CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
                child: Text("Open camera"),
                onPressed: () => scope.onBackReaction.excite(ImageSource.camera)
            ),
            CupertinoActionSheetAction(
                child: Text("Open gallery"),
                onPressed: () => scope.onBackReaction.excite(ImageSource.gallery)
            )
          ],
          cancelButton: CupertinoActionSheetAction(
              child: Text("Close", style: TextStyle(fontWeight: FontWeight.w600),),
              onPressed: () => scope.onBackReaction.excite(null)
          )
      );

  Widget _buildForOthers() =>
      SimpleDialog(
          children: [
            SimpleDialogOption(
                child: Padding(
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    child: Text("Open camera", style: TextStyle(fontSize: 18))
                ),
                onPressed: () => scope.onBackReaction.excite(ImageSource.camera)
            ),
            SimpleDialogOption(
                child: Padding(
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    child: Text("Open gallery", style: TextStyle(fontSize: 18))
                ),
                onPressed: () => scope.onBackReaction.excite(ImageSource.gallery)
            )
          ],
      );
}
