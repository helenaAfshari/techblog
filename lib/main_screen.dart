import 'package:flutter/material.dart';
import 'package:tecblog/gen/assets.gen.dart';
import 'package:tecblog/models/data_models.dart';
import 'package:tecblog/my_colors.dart';
import 'package:tecblog/my_strings.dart';
import 'gen/assets.gen.dart';
import 'models/fake_data.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    double bodyMargin = size.width / 12;
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: solidColors.scafoldBg,
            title: 
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.menu,color: Colors.black,),
                    Image(
                      image: Assets.images.logo,
                      height: size.height / 13.6,
                    ),
                    Icon(Icons.search,color: Colors.black,),
                  ],
                ),
          ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
            child: Column(
              children: [
            
      
              
                Stack(
                  children: [
                    Container(
                      width: size.width / 1.16,
                      height: size.height / 4.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        image: DecorationImage(
                          image: AssetImage(homePagePosterMap["imageAsset"]),
                          fit: BoxFit.cover,
                        ),
                      ),
                      foregroundDecoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          gradient: const LinearGradient(
                            colors: gradientColors.homePosterCoverGradiant,
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          )),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                homePagePosterMap["writer"] +
                                    " _ " +
                                    homePagePosterMap["date"],
                                style: textTheme.subtitle1,
                              ),
                              Row(
                                children: [
                                  Text(
                                    homePagePosterMap["view"],
                                    style: textTheme.subtitle1,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Icon(
                                    Icons.remove_red_eye_sharp,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            "دوازده قدم برنامه نویسی .............",
                            style: textTheme.headline1,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: tagList.length,
                      itemBuilder: ((context, index) {
                        return Container(
                          height: 60,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                              gradient: LinearGradient(
                                colors: gradientColors.tags,
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                              )),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                            child: Row(
                              children: [
                                ImageIcon(
                                  Assets.icons.hashtag,
                                  color: Colors.white,
                                  size: 16,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  tagList[index].title,
                                  style: textTheme.headline2,
                                )
                              ],
                            ),
                          ),
                        );
                      })),
                ),
                const SizedBox(
                  height: 32,
                ),
      
                //seeMore
                Padding(
                  padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
                  child: Row(
                    children: [
                      ImageIcon(
                        Assets.icons.bluePen,
                        color: solidColors.seeMore,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        myStrings.viewHotestBlog,
                        style: textTheme.headline3,
                      )
                    ],
                  ),
                ),
      
                SizedBox(
                  height: size.height / 3.5,
                  child: ListView.builder(
                      itemCount: blogList.getRange(0, 5).length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding:  EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    right: index == 0 ? bodyMargin : 15),
                                child: SizedBox(
                                  height: size.height / 5.3,
                                        width: size.width / 2.4,
                                  child: Stack(
                                    children: [
                                      Container(
                                        
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.all(Radius.circular(16)),
                                          image: DecorationImage(
                                            image: NetworkImage(blogList[index].imageUrl),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
      
                                        //سایه عکس که به صورت لیست هست مشاهده داغ ترین ها
                                        foregroundDecoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(16),
                                          gradient: const LinearGradient(
                                            colors: gradientColors.blogPost,
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 8,
                                        left: 0,
                                        right: 0,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              blogList[index].writer+
                                                  " _ " ,
                                                  style: textTheme.subtitle1,
                                                
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  blogList[index].views,
                                                  style: textTheme.subtitle1,
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                const Icon(
                                                  Icons.remove_red_eye_sharp,
                                                  color: Colors.white,
                                                  size: 16,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            
                            SizedBox(
                              width: size.width/2.4,
                              child: 
                            
                            Text(
      
                              blogList[index].title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              ))
                            
                            ],
                          ),
                        );
                      }
                      )
                      ),
      
                      
                ),
      
                //hotPodcast
                  SizedBox(
               
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,0,32,0,),
                          child: ImageIcon(
                            Assets.icons.microphone,
                            color: solidColors.seeMore, ),
                        ),
                           
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,0,8,0),
                          child: Text(myStrings.viewHotestPadCasts,style: textTheme.headline3,),
                        )
                      ],
                    ),
                  ),
      
                   SizedBox(
                     height: size.height/29,
                   ),
                

                //podcast
                    
                     SizedBox(
                   height: size.height / 3.5,
                  child: ListView.builder(
                      itemCount:podcast.length,
                       scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) {
                         return Column(
                          children: [
                             SizedBox(
                               height: size.height / 7.5,
                                    width: size.width / 3.1,
                           child: Container(
                            
                             decoration: BoxDecoration(
                              borderRadius:
                                   BorderRadius.all(Radius.circular(16)),
                               image: DecorationImage(
                                 image: NetworkImage(podcast[index].imageUrl),
                                fit: BoxFit.cover,
                             ),
                            ),
      
                                
                           ),
                            ),
                          
                         SizedBox(
                           width: size.width/2.4,
                           child: 
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                podcast[index].title,
                               
                               ),
                            ),
                          )),
                          
                          ],
                        );
                       }
                     )
                      ),
      
                      
                ),
                  
              ],
               
      
                  
            ),
            
            
          ),
          
        ),
      ),
       bottomNavigationBar: Container(
         height: size.height/10,
         decoration: const BoxDecoration(
           gradient: LinearGradient(
             colors: gradientColors.bottomNavBackground,
             begin: Alignment.topCenter,
             end: Alignment.bottomCenter,


           )
         ),

         child: Container(
           height: size.height/8,
           decoration: const BoxDecoration(
             borderRadius: BorderRadius.all(Radius.circular(18)),
             gradient: LinearGradient(colors: gradientColors.bottomNave)
           ),
           child: Row(
             children: [
                  
                 IconButton(onPressed: () {
                   
                 }, icon: ImageIcon(Assets.icons.home))
                  
             ],
           ),
         ),
       ),

    )
    );
  }
}
