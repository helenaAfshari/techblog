// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tecblog/gen/assets.gen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tecblog/view/main_screen.dart';
import 'package:tecblog/my_colors.dart';
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
     
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) =>const MainScreen()
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