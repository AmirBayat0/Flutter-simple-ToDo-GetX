import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bindings/bindings.dart';
import './routes/routes.dart';

void main()async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static void changeNavBarColor(Color color, Brightness brightness) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: color, statusBarIconBrightness: brightness));
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.montserratTextTheme()),
      initialBinding: MyBindings(),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.leftToRight,
      getPages: Routes.pages,
      initialRoute: "/homescreen",
    );
  }
}
