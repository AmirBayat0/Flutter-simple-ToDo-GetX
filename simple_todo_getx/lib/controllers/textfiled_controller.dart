import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TextFieldController extends GetxController {
  TextEditingController? taskTitle;
  TextEditingController? taskSubtitle;

  @override
  void onInit() {
    taskTitle = TextEditingController();
    taskSubtitle = TextEditingController();
    super.onInit();
  }
}
