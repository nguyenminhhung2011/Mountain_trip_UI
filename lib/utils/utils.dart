import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

import '../misc/colors.dart';

pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _file = await _imagePicker.pickImage(source: source);
  if (_file != null) {
    return await _file.readAsBytes();
  }
  print('No image selected');
}

void SnackBarError(String msg) {
  Get.snackbar(
    "Error",
    msg,
    duration: Duration(seconds: 2),
    backgroundColor: AppColors.mainColor,
  );
}
