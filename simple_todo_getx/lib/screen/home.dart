import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/task_controller.dart';
import '../controllers/textfiled_controller.dart';
import '../constant.dart';
import '../main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);


/////////////////////////////////////
//@CodeWithFlexz on Instagram
//
//AmirBayat0 on Github
//Programming with Flexz on Youtube
/////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    MyApp.changeNavBarColor(kLightBlueColor, Brightness.light);
    return SafeArea(
      child: Scaffold(
        floatingActionButton: MyFloatingActionButton(),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            TopSectionWidget(),
            BottomSectionWidget(),
          ],
        ),
      ),
    );
  }
}

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'hero',
      backgroundColor: kLightBlueColor,
      elevation: 1,
      tooltip: 'Add Task',
      onPressed: () {
        Get.find<TaskController>().isEditing = false;
        Get.find<TextFieldController>().taskTitle!.text = '';
        Get.find<TextFieldController>().taskSubtitle!.text = '';
        Get.toNamed("/addtasksscreen")!.then((value) {
          return MyApp.changeNavBarColor(kLightBlueColor, Brightness.light);
        });
      },
      child: const Icon(Icons.add),
    );
  }
}

class BottomSectionWidget extends StatelessWidget {
  const BottomSectionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: kFinalWitdth,
        height: kFinalHeight / 1.7,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Obx(() {
          return Container(
              margin: const EdgeInsets.all(20),
              child: Get.find<TaskController>().tasks.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Latest",
                            style: TextStyle(
                                fontWeight: FontWeight.w200,
                                color: Colors.grey),
                          ),
                        ),
                        Container(
                            width: kFinalWitdth,
                            height: kFinalHeight / 2,
                            child: Obx(() {
                              return ListView.builder(
                                itemBuilder: (ctx, index) {
                                  var task =
                                      Get.find<TaskController>().tasks[index];
                                  return ListTile(
                                    onLongPress: () {
                                      Get.defaultDialog(
                                          title: 'Warning!',
                                          middleText: "Are you sure?",
                                          textConfirm: "Yes",
                                          confirmTextColor: Colors.white,
                                          textCancel: "Cancel",
                                          onConfirm: () {
                                            Get.find<TaskController>()
                                                .tasks
                                                .removeAt(index);
                                            Get.back();
                                          },
                                          onCancel: () {
                                            Get.back();
                                          });
                                    },
                                    onTap: () {
                                      Get.find<TaskController>().isEditing =
                                          true;
                                      Get.find<TaskController>().index = index;
                                      Get.find<TextFieldController>()
                                          .taskTitle!
                                          .text = task.title!;
                                      //
                                      Get.find<TextFieldController>()
                                          .taskSubtitle!
                                          .text = task.subtitle!;
                                      //
                                      Get.toNamed("/addtasksscreen");
                                    },
                                    title: Text(task.title ?? "",
                                        style: TextStyle(
                                            decoration: task.status ?? false
                                                ? TextDecoration.lineThrough
                                                : TextDecoration.none,
                                            color: task.status ?? false
                                                ? Colors.blue
                                                : Colors.black)),
                                    subtitle: Text(task.subtitle ?? "",
                                        style: TextStyle(
                                            decoration: task.status ?? false
                                                ? TextDecoration.lineThrough
                                                : TextDecoration.none,
                                            color: task.status ?? false
                                                ? Colors.blue
                                                : Colors.black)),
                                    trailing: Checkbox(
                                      value: task.status,
                                      onChanged: (val) {
                                        task.status = !task.status!;
                                        Get.find<TaskController>()
                                            .tasks[index] = task;
                                      },
                                      activeColor: kLightBlueColor,
                                      side: BorderSide(
                                          color: Colors.black45, width: 1.5),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                  );
                                },
                                itemCount:
                                    Get.find<TaskController>().tasks.length,
                              );
                            })),
                      ],
                    )
                  : Center(
                      child: Text("No Task Added!"),
                    ));
        }));
  }
}

class TopSectionWidget extends StatelessWidget {
  const TopSectionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kFinalWitdth,
      color: kLightBlueColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Tooltip(
                  message: 'More',
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Tooltip(
                      message: "Delete All Tasks",
                      child: IconButton(
                        onPressed: () {
                          Get.find<TaskController>().tasks.value = [];
                        },
                        icon: const Icon(
                          Icons.delete,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Tooltip(
                      message: 'Your Profile',
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.person,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 40.0, top: 40.0),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              child: Center(
                child: Icon(
                  Icons.paste_rounded,
                  color: kLightBlueColor,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 48.0, top: 12.0),
            child: Text(
              "All",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              margin: EdgeInsets.only(
                left: 47.0,
              ),
              child: Obx(() {
                return Text(
                  "${Get.find<TaskController>().tasks.length} Tasks",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500),
                );
              })),
        ],
      ),
    );
  }
}
