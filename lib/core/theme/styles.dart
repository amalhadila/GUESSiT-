import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guessit_task/core/theme/color_app.dart';

abstract  class Styles {
  static TextStyle textStyle22=   GoogleFonts.montserrat
(
    fontSize: 22.sp,
    fontWeight: FontWeight.w900,
    color: ColorApp.primaryColor,
  );
   static TextStyle textStyle25=   GoogleFonts.montserrat
(
    fontSize:25.sp,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );
     static TextStyle textStyle24=   GoogleFonts.montserrat
(
    fontSize:24.sp,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );
  static TextStyle textStyle18=   GoogleFonts.montserrat
(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
    static TextStyle textStyle16=   GoogleFonts.montserrat

(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: Colors.white
  );

 static TextStyle textStyle16semibold= GoogleFonts.montserrat

(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white
  );

   static TextStyle textStyle14=   GoogleFonts.montserrat

(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: Colors.white
  );

}