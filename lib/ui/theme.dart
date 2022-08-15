import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const Color bluishClr = Color(0xff0F3D3E);
const Color secColor  =Color(0xffE2DCC8);
const primaryClr =        bluishClr;
const Color darkGreyClr=Color(0xff000000);
const darkHeaderClr =   Color(0xff000000);
class Themes{
TextStyle get subHeadingStyle{
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: Get.isDarkMode?Colors.grey[400]:Colors.grey
    )
  );
}

TextStyle get headingStyle{
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode?Colors.white:Colors.black
    )
  );
}

TextStyle get titleStyle{
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: Get.isDarkMode?Colors.white:Colors.black
    )
  );
}

TextStyle get subTitleStyle{
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w300,
      color: Get.isDarkMode?Colors.grey[100]:Colors.grey[700]
    )
  );
}}
