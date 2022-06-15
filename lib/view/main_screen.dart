import 'package:flutter/material.dart';
import 'package:tecblog/gen/assets.gen.dart';
import 'package:tecblog/my_colors.dart';
import 'package:tecblog/view/home_screen.dart';
import 'package:tecblog/view/profile_screen.dart';
import '../gen/assets.gen.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);


  
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
    var selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    double bodyMargin = size.width / 12;

  
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: SolidColors.scafoldBg,
            title: 
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(Icons.menu,color: Colors.black,),
                    Image(
                      image: Assets.images.logo,
                      height: size.height / 13.6,
                    ),
                    const Icon(Icons.search,color: Colors.black,),
                  ],
                ),
          ),
      body: Stack(
        children: [
          Positioned.fill(
            child: IndexedStack(
                 
                 //selectedpage index چون تعریف کردیم زمانی که روی دکمه هرکدوم را انتخاب کنیم لایه مورد نظر باز میشه
               index: selectedPageIndex,
               children: [
             HomeScreen(size: size, textTheme: textTheme, bodyMargin: bodyMargin),
             ProfileScreen(size: size, textTheme: textTheme, bodyMargin: bodyMargin),
            

               ],
            ),

           ),
           BottomNavigation(
             size: size,
              bodyMargin: bodyMargin,
              //valueاسم دلبخواهی است 
              changeScreen: (int value){
                   
                   //چون تغییر میکند باید از setStateاستفاده کنیم 
                   setState(() {
                     selectedPageIndex = value;
                   });
                
              },),

        ],
         
      ),
      

    )
    );
  }
}


class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    //داخل کانستراکتور تعریف کردیم که بتوانیم از بیرون پاس بدهیم بهش 
    Key? key,
    required this.size,
    required this.bodyMargin,
     required this.changeScreen,
    
  }) : super(key: key);

  final Size size;
  final double bodyMargin;

  //نوعی متد تعریف کردن است
  final Function(int) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0 ,
      right: 0,
      left: 0,
      child: Container(
             height: size.height/10,
             decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: GradientColors.bottomNavBackground,
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
    
    
      )
             ),
    
             child: Padding(
      padding:  EdgeInsets.only(right: bodyMargin,left: bodyMargin),
      child: Container(
        height: size.height/8,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(18)),
          gradient: LinearGradient(colors: GradientColors.bottomNave)
        ), 
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
               
              IconButton(onPressed: () => changeScreen(0),

               icon: ImageIcon(Assets.icons.home,color: Colors.white,
              )
    
              ), IconButton(onPressed: () {
                
              }, icon: ImageIcon(Assets.icons.writer,color: Colors.white,
              )
    
              ), IconButton(onPressed: () =>changeScreen(1), icon: ImageIcon(Assets.icons.user,color: Colors.white,
              )
    
              ),
               
          ],
        ),
        
      ),
             ),
             
           ),
    );
  }
}



