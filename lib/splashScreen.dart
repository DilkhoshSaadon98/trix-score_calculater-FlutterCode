import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/MyHomePage.dart';
import 'package:flutter_application_1/ui/theme.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:lottie/lottie.dart';
import 'MyHomePage.dart';

// ignore: camel_case_types
class splashScreen extends StatelessWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width:double.infinity,
        height: double.infinity,
        color: Get.isDarkMode?primaryClr:secColor,
        child: Column(
          children: [
            Expanded(
              flex: 60,
              child: AnimatedSplashScreen(
                splashIconSize:250,
                backgroundColor: Get.isDarkMode?primaryClr:secColor,
                splash:LottieBuilder.asset("images/card.json"
                  ,animate: true,
                  width: 350,
                  height: 100,
                  alignment: Alignment.center,),
                nextScreen:const MyHomePage(),
                duration: 2000,
                splashTransition: SplashTransition.fadeTransition,
                ),
            ),
            Expanded(
              flex: 20,
              child: LottieBuilder.asset("images/waiting.json"
              ,animate: true,),
            )
               
            
            //  Expanded(
            //   flex: 100,
            //   child: Text("Trix Score Calculater"))
            
          ],
        ),
      ));
  }
}