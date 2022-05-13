
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'gen/assets.gen.dart';
import 'package:tecblog/my_colors.dart';
import 'Splash_screen.dart';



void main() {

     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
         statusBarColor: solidColors.statuseBarColor,
         statusBarIconBrightness: Brightness.dark,
         systemNavigationBarColor: solidColors.systemNavigationBarColor,
         systemNavigationBarIconBrightness: Brightness.dark,
         
       ));

  runApp(const MyApp());
}
       
      
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  localizationsDelegates: [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  supportedLocales: [
   Locale('fa', ''), // farsi
  ],
  theme: ThemeData(
    fontFamily: 'dubai',
    textTheme: const TextTheme(
      headline1:  
         TextStyle(fontFamily: 'dubai',color: solidColors.posterTitle,fontWeight:FontWeight.w700,fontSize: 16),
      subtitle1:  
               TextStyle(fontFamily: 'dubai',color: solidColors.posterSubTitle,fontWeight:FontWeight.w700,fontSize: 14) ,
      bodyText1:  
             TextStyle(fontFamily: 'dubai',color: Colors.black12,fontWeight: FontWeight.w300,fontSize: 10),
      headline2: 
             TextStyle(fontFamily: 'dubai',color: Color.fromARGB(255, 148, 10, 31),fontWeight:FontWeight.w700,fontSize: 14),
      headline3:  
            TextStyle(fontFamily: 'dubai',color: Color.fromARGB(255, 173, 87, 100),fontWeight:FontWeight.w700,fontSize: 14),
      headline4: 
          TextStyle(fontFamily: 'dubai',color: Color.fromARGB(255, 41, 12, 16),fontWeight:FontWeight.w700,fontSize: 14),
      
    ),
    
  ),
  debugShowCheckedModeBanner: false,
    home: splashScreen());
  }
}
