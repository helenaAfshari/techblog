
import 'package:flutter/material.dart';
import 'package:tecblog/gen/assets.gen.dart';
import 'package:tecblog/my_colors.dart';
import 'gen/assets.gen.dart';
import 'models/fake_data.dart';
class MainScreen extends StatelessWidget{
 
  @override
  Widget build(BuildContext context) {
     var size = MediaQuery.of(context).size;
     var textTheme = Theme.of(context).textTheme;
   return  SafeArea(
     child: Scaffold(
       body: SafeArea(
         child: Padding(
           padding: const EdgeInsets.fromLTRB(0,16,0,0),
           child: Column(
             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                    
                    Icon(Icons.menu),
                    Image(
                      image: Assets.images.logo,
                      height: size.height/13.6,),
                    Icon(Icons.search),

               ],
               
               ),
               SizedBox(height: 8,),
               Stack(
                 children: [

                   Container(
                    
                     width: size.width/1.16,
                     height: size.height/4.2,
                     decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(16)),
                       image: DecorationImage(
                         image: AssetImage(homePagePosterMap ["imageAsset"]),
                         fit: BoxFit.cover,
                         ),
                     ),
                     foregroundDecoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(16)),
                       gradient: const LinearGradient(colors: gradientColors.homePosterCoverGradiant,
                       begin: Alignment.topCenter,
                       end: Alignment.bottomCenter,
                       
                       )
                         
                         ),
                   ),
                   
                   Positioned(
                       bottom: 20,
                       left: 0,
                       right: 0,
                     child: Column(children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                           Text(homePagePosterMap["writer"]+" _ "+homePagePosterMap["date"],style: textTheme.subtitle1,),
                          Row(
                            children: [
                             
                              Text(homePagePosterMap["view"],style: textTheme.subtitle1,),
                              SizedBox(width: 8,), 
                              Icon(Icons.remove_red_eye_sharp,color: Colors.white,size: 16,),
                            ],
                          ), 
                              
                            
                         ],

                       ),

                       Text("دوازده قدم برنامه نویسی .............",style: textTheme.headline1,),
                        
                     ],),
                   )
                 ],
               )
              ,
              SizedBox(
                height: 100,
                child: 

                ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: ((context, index) {
                  return Padding(

                    padding: const EdgeInsets.all(8.0),
                    child: Container(color: Colors.black, height: 20,width: 40,),
                  );
                })),
              )
             
             ],
           ),
         
         ),
        
   
     ),
   ));
 
  }


}