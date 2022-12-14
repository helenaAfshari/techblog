
import 'package:flutter/cupertino.dart';
import 'package:tecblog/constant/my_colors.dart';

class MyDecorations{
   
   //نمیشه دیگر ازش نمونه گرفت کلاس
      MyDecorations._();

  static BoxDecoration mainGradient = const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(18)),
                gradient: LinearGradient(colors: GradientColors.bottomNave));
}