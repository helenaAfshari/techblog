
import 'dart:io';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

import 'package:get/get.dart';
import 'package:html_editor_enhanced/utils/utils.dart';
import 'package:tecblog/component/decorations.dart';
import 'package:tecblog/constant/my_colors.dart';
import 'package:tecblog/controller/file_controller.dart';
import 'package:tecblog/controller/podcast/manage_podcast_controller.dart';
import 'package:tecblog/controller/podcast/single_podcast_controller.dart';
import 'package:tecblog/gen/fonts.gen.dart';
import 'package:tecblog/models/podcast_model.dart';

import '../../component/dimense.dart';
import '../../component/mycomponent.dart';
import '../../gen/assets.gen.dart';


class SingleManagePodcast extends StatelessWidget {
  
  
SinglePodcastController controller  =Get.put(SinglePodcastController());
ManagePodcastController managePodcastController =Get.put(ManagePodcastController());
FilePickerController filePickerController =Get.put(FilePickerController());


 @override
  Widget build(BuildContext context) {
       var textheme = Theme.of(context).textTheme;
       
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Obx(
            (() =>  Column(
                      children: [
                        Stack(
                          children: [
                            filePickerController.file.value.name=='nothing'?
                            CachedNetworkImage(
                             // imageUrl: managePodcastController.podcastFileModel.value.,
                             imageUrl: "https://s2.uupload.ir/files/th_occc.jpg",
                              imageBuilder: ((context, imageProvider) =>
                                  Image(image: imageProvider)),
                              placeholder: ((context, url) => const loading()),
                              errorWidget: ((context, url, error) =>
                                  Image.asset(Assets.images.singlePlaceHolder.path)),
                                  
                            ): Image.file(File(filePickerController.file.value.path!)),
                            Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: 60,
                                  decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                          end: Alignment.bottomCenter,
                                          begin: Alignment.topCenter,
                                          colors:
                                              GradientColors.singleAppbarGradiant)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children:  [
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      GestureDetector(
                                        onTap: () => Get.back(),
                                        child:const  Icon(
                                          Icons.arrow_back,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                      ),                           
                                    
                                    ],
                                  ),
                                  
                                )),
                               Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child:
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              //pickFile
                             
                            },
                            child: Container(
                                                   
                            height: 30,
                            width: Get.width/3,
                            decoration: const BoxDecoration(
                              color: SolidColors.prymaryColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                               Text("انتخاب تصویر",style: textheme.headline2,),
                               const Icon(Icons.add,color: Colors.white,)
                              ],
                            ),
                                                 ),
                          ),
                        )),
                          ],
                        ),
                          
                        GestureDetector(
                          onTap: (() {
                            getTitle();
                          }),
                          child: Padding(
                            padding:  EdgeInsets.only(top: Dimens.bodyMargin/3),
                            child: SeeMoreBlog(
                         bodyMargin: Dimens.bodyMargin/2, textTheme: textheme, title: ' ویرایش عنوان پادکست',),
                          ),
                        ),
                      
                          Padding(
                            padding:  EdgeInsets.only(left: Dimens.bodyMargin*1),
                            child:  Text(
                              managePodcastController.podcastFileModel.value.title!,
                               maxLines: 2,
                              style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),
                            ),
                          ),
                        SizedBox(height: Dimens.bodyMargin*1.2,),
                    
                          GestureDetector(
                          onTap: (() {
                            bottomSheet();
                          }),
                          child: SeeMoreBlog(
                         bodyMargin: Dimens.bodyMargin/2, textTheme: textheme, title: ' اضافه کردن فایل',),
                        ),
                          
                          SizedBox(
                            width: double.infinity,
                            height: 150,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: 5,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:  EdgeInsets.only(right: Dimens.bodyMargin/2,left: Dimens.bodyMargin/2,top: Dimens.bodyMargin/3),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                      Row(
                                      
                                        children: [
                                          ImageIcon(Image.asset(Assets.icons.microphone.path).image,color: SolidColors.seeMore,),
                                          SizedBox(width: 8,),
                                          Text("بخش چهارم : فریلنسر دیوانه",style: textheme.headline4,)
                                        ],
                                      ),
            
                                      Text("22:00"),
                //                      Obx(
                //   ()=>Text("${managePodcastController.selectedTime.value.hour}:${managePodcastController.selectedTime.value.minute}",style: TextStyle(fontSize: 25),),
                  
                // ),
                                  ],
                                ),
                              );
                            },),
                          ),
                    
                            
                      ])),
          )),
          
        ),
          Positioned(
              bottom: 8,
              right: Dimens.bodyMargin,
              left: Dimens.bodyMargin,
              child: Container(
                height: Get.height/7,
                decoration: MyDecorations.mainGradient,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                       Obx(
                         ()=> ProgressBar(
                          timeLabelTextStyle: TextStyle(color: Colors.white) ,
                          thumbColor: Colors.yellow,
                          baseBarColor: Colors.white,
                          buffered: controller.bufferedValue.value,
                          progressBarColor: Colors.orange,
                          progress: controller.progressValue.value,
                          onSeek: (position) {
                            controller.player.seek(position);
                            
                            controller.player.playing?
                            controller.startProgress():controller.timer!.cancel();
                          },
                          total: controller.player.duration??Duration(seconds: 0)),
                       ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              await controller.player.seekToNext();
                              controller.currentFileIndex.value = controller.player.currentIndex!;
                              controller.timerCheck();
                            },
                            child: const Icon(
                              Icons.skip_next,
                              color: Colors.white,
                            ),
                          ),
                          
                            GestureDetector(
                            onTap: () {
                                  
                              
                              controller.player.playing?
                              controller.timer!.cancel():
                              controller.startProgress();


                              controller.player.playing?
                              controller.player.pause():
                              controller.player.play();
                               
                               
                      
                              controller.playState.value  = controller.player.playing;
                          
                              controller.currentFileIndex.value = controller.player.currentIndex!;

                            },
                            child: Obx(
                              ()=> Icon(
                                 controller.playState.value?
                                  Icons.pause_circle_filled:
                                 Icons.play_circle_fill,
                                
                                 color: Colors.white,
                                 size: 48,
                              ),
                            ),
                          ),
                          
                            GestureDetector(
                              onTap: () async {
                               await controller.player.seekToPrevious();
                               controller.currentFileIndex.value = controller.player.currentIndex!;
                               controller.timerCheck();
                              },
                              child: const Icon(
                              Icons.skip_previous,
                              color: Colors.white,
                              ),
                            ), 
                            const SizedBox(),
                           Obx(
                              ()=>GestureDetector(
                                onTap: () {
                                  controller.setLoopMode();
                                },
                                child: Icon(
                                Icons.repeat,
                                color:controller.isLoopAll.value?Colors.blue: Colors.white,
                             ),
                              ),
                           ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        )
      ),
    );
  }
  
    getTitle(){
    
      Get.defaultDialog(

        title: "لطفا یک عنوان پرمعنا انتخاب کن",

       titleStyle:const TextStyle(
        color: Color.fromARGB(255, 11, 10, 10)), 
       content:  
         
           TextField(
            //controller: managePodcastController.titleTextEditingController,
            controller: managePodcastController.titleTextEditingControllerMinute,
            keyboardType: TextInputType.text,
            style: const TextStyle(
              color: Color.fromARGB(255, 0, 6, 11),
            ),
            decoration: const InputDecoration(
              hintText: 'اینجا بنویس',
              fillColor: Color.fromARGB(255, 251, 252, 252),
            ),
           ),
      
        backgroundColor: Color.fromARGB(255, 249, 247, 250),
       radius: 8,
       confirm: Row(
         children: [
       TextButton(onPressed: ()async {
         managePodcastController.titleUpdate();

       }, child: Text("تایید",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
        TextButton(onPressed: () {
             Get.back();
       }, child: Text("بعدا",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),))
         ],
       ),
       
      );
    }

  bottomSheet(){
  
    Get.bottomSheet(
      Container(
        height: Get.height/2.2,
        width: Get.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
          color: SolidColors.submitPodCast,
          ),
          child:  Column(
                 children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Image.asset(Assets.icons.file.path,height: 32,),
                     Padding(
                       padding: const EdgeInsets.only(left: 25,right: 30,top: 15),
                       child: SvgPicture.asset(Assets.images.bot.path,height: 50 ,),
                     ),
                    const Padding(
                      padding: EdgeInsets.only(left: 35,top: 50),
                      child: Text("لطفا زمان و فایل قسمت جدید پادکست رو وارد کن",style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    ],
                  ),
            
                  Padding(
                    padding:  EdgeInsets.only(top: Dimens.bodyMargin/1.4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container( 
                          height:Get.height/6,
                          width: Get.width/3.1,
                         decoration: const 
                         BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              
                              IconButton(
                                iconSize: 60.0,
                                onPressed: () {
                                //انتخاب فایل صوتی
                                //audioFile
                              }, icon: ImageIcon(AssetImage(Assets.icons.file.path))),
                              const Text("انتخاب فایل صوتی",
                              style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                       SizedBox(width: Get.width/14,),
                     
                          Container(
                          height:Get.height/6,
                          width: Get.width/2.1,
                            decoration: const BoxDecoration(shape: BoxShape.rectangle,
                            color: Colors.white),
                           // child: managePodcastController.chooseTime(),
                           child: Obx(
                             () =>  Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                  SizedBox(
                                    height:Dimens.bodyMargin*5 ,
                                    width: Dimens.bodyMargin*1.7,
                                   
                                  child: Column(
                                  children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 12),
                                  child: TextField(   
                                    maxLength: 2,
                                    controller: managePodcastController.titleTextEditingControllerMinute,
                                    keyboardType: TextInputType.number,
                                      cursorColor: Colors.black,
                                       style: const TextStyle(color: Colors.black),
                                    decoration: const InputDecoration(
                                        fillColor: Color.fromARGB(255, 203, 202, 202),
                                     border: OutlineInputBorder(),
                                     hintText: "Enter Number",
                                    ),
                                    
                                    onChanged: (value) {
                                                          
                                    managePodcastController.input!.value=int.tryParse(
                                    value)!;
                                    if(managePodcastController.input!>60){
                                        managePodcastController.isvisibleMinute.value=true;
                                    
                                    }else{
                                     managePodcastController.isvisibleMinute.value=false;
                                     value="";
                                    }
                                    }),
                                ),
                                  Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: Row(
                                      
                                      children: [ 
                                        Visibility(
                                               visible: managePodcastController.isvisibleMinute.value, 
                                                    child: const Padding(
                                                      padding: EdgeInsets.all(3),
                                                      child: Text("Eror",
                                                      style: TextStyle(color: Color.fromARGB(255, 250, 1, 1)),),
                                                    ),
                                                   ),
                                                 
                                                 const Text("دقیقه",style: TextStyle(color: Colors.black),
                                               ),
                                      ],
                                    ),
                                  ),
                                            
                                  ],
                                ),
                                                    
                                  ),      
                                   
                                   const Padding(
                                     padding: EdgeInsets.only(bottom: 50),
                                     child: Text(":",style: TextStyle(fontWeight: FontWeight.bold,fontSize:50),),
                                   ),
                           
                                    SizedBox(
                                    height:Dimens.bodyMargin*5 ,
                                    width: Dimens.bodyMargin*1.7,
                                   
                                  child: Column(
                                  children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 12),
                                  child: TextField(   
                                    maxLength: 2,
                                    
                                    controller: managePodcastController.titleTextEditingControllerHour,
                                    keyboardType: TextInputType.number,
                                      cursorColor: const Color.fromARGB(255, 12, 12, 12),
                                       style: const TextStyle(color: Color.fromARGB(255, 126, 4, 4)),
                                    decoration: const InputDecoration(
                                      fillColor: Color.fromARGB(255, 203, 202, 202),
                                     border: OutlineInputBorder(),
                                  
                                     hintText: "Enter Number",
                                    ),
                                    
                                    onChanged: (value) {
                                                          
                                    managePodcastController.inputHoure!.value=int.tryParse(
                                    value)!;
                                    if(managePodcastController.inputHoure!>12){
                                        managePodcastController.isvisibleHour.value=true;
                                        
                                        managePodcastController.titleTextEditingControllerHour.clear();
                                       
                                    
                                    }else{
                                     managePodcastController.isvisibleHour.value=false;
                                     value="";
                                    }
                                    }),
                                ),
                                  Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: Row(
                                      
                                      children: [ 
                                        Visibility(
                                               visible: managePodcastController.isvisibleHour.value, 
                                                    child: const Padding(
                                                      padding: EdgeInsets.all(3),
                                                      child: Text("Eror",
                                                      style: TextStyle(color: Color.fromARGB(255, 250, 1, 1)),),
                                                    ),
                                                   ),
                                                   const SizedBox(width: 1,),
                                                 const Text("ساعت",style: TextStyle(color: Colors.black),
                                                 ),
                                      ],
                                    ),
                                  ),
                                          
                                             
                                            
                                  ],
                                ),
                                                    
                                  ), 
                              ],
                             ),
                           ),
                           
                          ),
                   
                    ],
                  ),
                  ),
                 Padding(
                     padding: const EdgeInsets.only(top: 30),
                     child: ElevatedButton(
              style:  ButtonStyle(fixedSize: MaterialStateProperty.all(Size(Get.width/3,56))),
                    onPressed: (() {
                     // Get.toNamed(NamedRoute.singleManageArticle);
                    }),
                    child: const Text(
                      "تایید",
                    ),
                  ),
                   ),
                  ],
                    ),
         
          
              ),
              
          ) ;
          
  }
  //   Widget hourMinuteSecond(){
  //   return new TimePickerSpinner(
  //     isShowSeconds: true,
     
  //     onTimeChange: (time) {
  //       setState(() {
  //         _dateTime = time;
  //       });
  //     },
  //   );
  // }
  
}

