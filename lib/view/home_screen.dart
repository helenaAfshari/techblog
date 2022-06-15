



import 'package:flutter/material.dart';

import 'package:tecblog/models/fake_data.dart';
import 'package:tecblog/my_colors.dart';
import 'package:tecblog/my_strings.dart';
import '../gen/assets.gen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: Column(
          children: [
        
        
          
            HomePagePoster(size: size, textTheme: textTheme),
           
            const SizedBox(
              height: 16,
            ),
            
            HomePageTagList(textTheme: textTheme),
            const SizedBox(
              height: 32,
            ),
        
            
            SeeMoreBlog(bodyMargin: bodyMargin, textTheme: textTheme),
        
            HomePageBlogList(size: size, bodyMargin: bodyMargin, textTheme: textTheme),
        
            //hotPodcast
              SeeMorePodcast(textTheme: textTheme),
        
               SizedBox(
                 height: size.height/29,
               ),
            
      
            //podcast
                
                 HomePagePodcastList(size: size),
              
             const SizedBox(height: 60,),
          
          ],
           
        
              
        ),
        
        
      ),
      
    ),
        );
  }
}

class HomePagePodcastList extends StatelessWidget {
  const HomePagePodcastList({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  const BorderRadius.all(Radius.circular(16)),
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
        
     
            );
  }
}

class SeeMorePodcast extends StatelessWidget {
  const SeeMorePodcast({
    Key? key,
    required this.textTheme,
  }) : super(key: key);

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
           
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0,0,32,0,),
            child: ImageIcon(
              Assets.icons.microphone,
              color: SolidColors.seeMore, ),
          ),
             
          Padding(
            padding: const EdgeInsets.fromLTRB(0,0,8,0),
            child: Text(MyStrings.viewHotestPadCasts,style: textTheme.headline3,),
          )
        ],
      ),
    );
  }
}

class HomePageBlogList extends StatelessWidget {
  const HomePageBlogList({
    Key? key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                                  const BorderRadius.all(Radius.circular(16)),
                              image: DecorationImage(
                                image: NetworkImage(blogList[index].imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
        
                            //سایه عکس که به صورت لیست هست مشاهده داغ ترین ها
                            foregroundDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: const LinearGradient(
                                colors: GradientColors.blogPost,
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
        
          
    );
  }
}

class SeeMoreBlog extends StatelessWidget {
  const SeeMoreBlog({
    Key? key,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
      child: Row(
        children: [
          ImageIcon(
            Assets.icons.bluePen,
            color: SolidColors.seeMore,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            MyStrings.viewHotestBlog,
            style: textTheme.headline3,
          )
        ],
      ),
    );
  }
}

class HomePageTagList extends StatelessWidget {
  const HomePageTagList({
    Key? key,
    required this.textTheme,
  }) : super(key: key);

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tagList.length,
          itemBuilder: ((context, index) {
            return MainTags(textTheme: textTheme,index: index,);
          })),
    );
  }
}

class MainTags extends StatelessWidget {
   MainTags({
    Key? key,
    required this.textTheme,
    required this.index,
  }) : super(key: key);

  final TextTheme textTheme;
   var index;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
          borderRadius:
              BorderRadius.all(Radius.circular(40)),
          gradient: LinearGradient(
            colors: GradientColors.tags,
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
            const SizedBox(
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
  }
}

 class HomePagePoster extends StatelessWidget {
  const HomePagePoster({
    Key? key,
    required this.size,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size.width / 1.16,
          height: size.height / 4.2,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            image: DecorationImage(
              image: AssetImage(homePagePosterMap["imageAsset"]),
              fit: BoxFit.cover,
            ),
          ),
          foregroundDecoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              gradient: LinearGradient(
                colors: GradientColors.homePosterCoverGradiant,
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
              Text(
                "دوازده قدم برنامه نویسی .............",
                style: textTheme.headline1,
              ),
            ],
          ),
        )
      ],
    );
  }
}