import 'package:get/get.dart';

import '../controllers/task_controller.dart';
import '../controllers/textfiled_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TaskController());
    Get.put(TextFieldController());
  }
}
  