
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tecblog/gen/assets.gen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tecblog/main_screen.dart';
import 'package:tecblog/my_colors.dart';
class splashScreen extends StatefulWidget{
  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {


   @override
   void initState() {
   //چندثانیه صبر کن و بعد یک کاری انجام بده
   Future.delayed(Duration(seconds: 3 )).then((value) =>{
     
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>MainScreen()
          )),
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
               Image(image: Assets.images.logo,height: 64,),
               SizedBox(height: 10,),
               const SpinKitFadingCube(
              color: solidColors.prymaryColor,
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