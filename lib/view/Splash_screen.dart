// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tecblog/constant/my_colors.dart';
import 'package:tecblog/gen/assets.gen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tecblog/main.dart';
import 'package:tecblog/route_manager/names.dart';
import 'package:tecblog/view/main_screen/main_screen.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

   @override
   void initState() {
   //چندثانیه صبر کن و بعد یک کاری انجام بده
   Future.delayed(const Duration(seconds: 3 )).then((value) =>{
      Get.offAndToNamed(NamedRoute.routeMainScreen),
   } );
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
   return SafeArea(
     child: Scaffold(
       body: SafeArea(
         child: Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Image.asset(Assets.images.logo.path,height: 64,),
               const SizedBox(height: 10,),
               const SpinKitFadingCube(
              color: SolidColors.prymaryColor,
                  size: 32,
             ),
             ],
           ),
         ),
       ),
   
     ),
   );
  }
}