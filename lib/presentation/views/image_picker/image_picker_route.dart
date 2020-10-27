import 'dart:io';

import 'package:architecture/presentation/navigation/route.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerRoute extends Route<ImageSource, File> {

  @override
  Future<File> add(ImageSource source) async => await ImagePicker.pickImage(source: source);
}
