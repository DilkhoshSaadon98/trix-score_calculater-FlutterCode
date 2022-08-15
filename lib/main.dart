import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/services.dart';
import 'package:flutter_application_1/splashScreen.dart';
import 'package:flutter_application_1/ui/theme.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

Future <void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryClr,
        brightness: Brightness.light,
        backgroundColor: secColor
      ),

      themeMode: ThemeServices().theme,
      
      darkTheme:ThemeData(
        backgroundColor: primaryClr,
        primaryColor: primaryClr,
        brightness: Brightness.dark   
      ),

      
      home: const splashScreen(),
    );
  }
}
