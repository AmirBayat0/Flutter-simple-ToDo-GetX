import 'package:get/get.dart';

import '../screen/add_tasks.dart';
import '../screen/home.dart';

class Routes {
  static List<GetPage> get pages => [
        GetPage(name: "/homescreen", page: () => const HomeScreen()),
        GetPage(name: "/addtasksscreen", page: () => const AddTasksScreen()),
      ];
}
