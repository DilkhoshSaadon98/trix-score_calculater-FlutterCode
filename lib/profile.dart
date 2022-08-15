import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
///import 'dart:async';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}
Future<void> url_launcher(String url)async{
  if(await canLaunch(url)){
    launch(url);
  }else{
    throw "error";
  }
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(context),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding:const EdgeInsets.symmetric(vertical: 30,horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundColor: !Get.isDarkMode?primaryClr:secColor,
              child:const CircleAvatar(
                radius: 75,
                backgroundImage: AssetImage("images/profile.jpg"),
              ),
            ),
            const SizedBox(height: 30,),
            Text("Dilkhosh Saadon",style: _beeTitleStyle(!Get.isDarkMode?primaryClr:secColor,25),),
            Text("Kurdistan - Iraq",style: _latoTitleStyle(!Get.isDarkMode?primaryClr:secColor,18)),
            Text("Mobile Developer",style: _latoTitleStyle(!Get.isDarkMode?primaryClr:secColor,18)),
            Divider(thickness: 1,
                    height: 40,
                    endIndent: 40,
                    indent: 40,
                    color:!Get.isDarkMode?primaryClr:secColor,),
            const SizedBox(height: 25,),
Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
                    children: [
                      IconButton(
                        onPressed: (){
                          url_launcher("https://m.facebook.com/profile.php?id=100008022852469");
                        }, 
                        icon: Icon(FontAwesomeIcons.facebookSquare,
                              color: !Get.isDarkMode?primaryClr:secColor,
                              size: 30,),
                  ),
                  IconButton(
                        onPressed: (){
                          url_launcher("https://github.com/DilkhoshSaadon98");
                        }, 
                        icon: Icon(FontAwesomeIcons.githubSquare,
                              color: !Get.isDarkMode?primaryClr:secColor,
                              size: 30,),
                  ),
                  IconButton(
                        onPressed: (){
                          url_launcher("https://www.linkedin.com/mwlite/in/dilkhosh-saadon-1430ba1a9?fbclid=IwAR2bqR_DnsEaO5gvn6eJUM4-IPNhzAQOVFlW2XpVqTQ_fWv6zTO0GLMRjrs");
                        }, 
                        icon: Icon(FontAwesomeIcons.linkedin,
                              color: !Get.isDarkMode?primaryClr:secColor,
                              size: 30,),
                  ),
                  IconButton(
                        onPressed: ()async{
                          url_launcher("whatsapp://send?phone=009647510407010");
                        },
                        icon: Icon(FontAwesomeIcons.whatsappSquare,
                              color: !Get.isDarkMode?primaryClr:secColor,
                              size: 30,),
                  ),
                  IconButton(
                        onPressed: ()async{
                          url_launcher("mailto:fares.baqe@gmail.com?subject=Hello Title&body=DDD");
                        } ,
                        icon: Icon(Icons.email_sharp,
                              color: !Get.isDarkMode?primaryClr:secColor,
                              size: 30,),
                  )
                  ], )
                ],
              ),
           
           
          ],
        ),
      ),
    );
  }


    _appBar(BuildContext context){
  return AppBar(
    title: Text("About me",style: _beeTitleStyle(!Get.isDarkMode?primaryClr:secColor,20),),
    backgroundColor: context.theme.backgroundColor,
    elevation: 0,
    leading: GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Icon(Icons.arrow_back_sharp,
      size: 25,
      color: !Get.isDarkMode?primaryClr:secColor,),
      
    ),
    
  );
}

_beeTitleStyle(Color col,double size){
    return GoogleFonts.aBeeZee(
                        textStyle: TextStyle(
                          fontSize: size,
                          fontWeight: FontWeight.bold,
                          color:col)
                        );
  }
_latoTitleStyle(Color col,double size){
    return GoogleFonts.lato(
                        textStyle: TextStyle(
                          fontSize: size,
                          fontWeight: FontWeight.w300,
                          color:col)
                        );
  }
}