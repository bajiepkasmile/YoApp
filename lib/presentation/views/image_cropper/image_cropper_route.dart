import 'dart:io';

import 'package:architecture/presentation/navigation/route.dart' as Arch;
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:yo_app/presentation/resources/app_colors.dart';

class ImageCropperRoute extends Arch.Route<File, File> {

  @override
  Future<File> add(File file) async => await ImageCropper.cropImage(
      sourcePath: file.path,
      aspectRatioPresets: [CropAspectRatioPreset.square],
      androidUiSettings: AndroidUiSettings(
        toolbarTitle: "",
        statusBarColor: Color(0x87000000),
        backgroundColor: Colors.white,
        activeControlsWidgetColor: AppColors.purple,
        showCropGrid: false,
        hideBottomControls: true
      )
  );
}
