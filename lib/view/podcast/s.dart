
import 'dart:io';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:html_editor_enhanced/utils/utils.dart';
import 'package:tecblog/Services/pick_file.dart';
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
import 'package:just_audio/just_audio.dart';



class Ss extends StatelessWidget {
  
SinglePodcastController controller  =Get.put(SinglePodcastController());
ManagePodcastController managePodcastController =Get.put(ManagePodcastController());
FilePickerController filePickerController =Get.put(FilePickerController());

  Ss({Key? key}) : super(key: key);

AudioPlayer audioPlayer =AudioPlayer();
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
          child:   Column(
                      children: [
  
                        SizedBox(height: Dimens.bodyMargin*1.2,),
                    
                          GestureDetector(
                          onTap: (() {
                            bottomSheet();
                          }),
                          child: SeeMoreBlog(
                         bodyMargin: Dimens.bodyMargin/2, textTheme: textheme, title: ' اضافه کردن فایل',),
                        ),                        
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: 2,

                          itemBuilder: (context, index) {
                          
                        return Center(
                         child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                             IconButton(
                             icon: Icon(Icons.play_arrow),
                            onPressed: () {
                            audioPlayer.play();
                              },
            ),
          ],
        ),
      );
                        },)
                      ]
                      ),
                 
                      ),
          ),
          
          ]
        )
      ),
    );
  }
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
                                audioFile();
                              }, icon: ImageIcon(AssetImage(Assets.icons.file.path))),
                              const Text("انتخاب فایل صوتی",
                              style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ]))])));}
                     
                     
                         
                          
                   
                
                 
                 
               
                 
                   
         
          
           
              
       
          
//   }
// // import 'package:file_picker/file_picker.dart';
// // import 'package:flutter/material.dart';
// // import 'dart:io';

// // class MyAudioPicker extends StatefulWidget {
// //   @override
// //   _MyAudioPickerState createState() => _MyAudioPickerState();
// // }

// // class _MyAudioPickerState extends State<MyAudioPicker> {
// //   File? _audioFile;

// //   void _pickAudio() async {
// //     FilePickerResult? result = await FilePicker.platform.pickFiles(
// //       type: FileType.audio,
// //     );
// //     if (result != null) {
// //       setState(() {
// //         _audioFile = File(result.files.single.path!);
// //       });
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Audio Picker'),
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: <Widget>[
// //             Text(
// //               'Selected Audio:',
// //               style: TextStyle(fontSize: 18.0),
// //             ),
// //             SizedBox(height: 10.0),
// //             if (_audioFile != null)
// //               Text(
// //                 _audioFile!.path,
// //                 style: TextStyle(fontSize: 16.0),
// //               )
// //             else
// //               Text(
// //                 'No audio selected',
// //                 style: TextStyle(fontSize: 16.0),
// //               ),
// //             SizedBox(height: 20.0),
// //             ElevatedButton(
// //               onPressed: _pickAudio,
// //               child: Text('Select Audio'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
  
// }



// import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';

// class MyAudioPlayer extends StatefulWidget {
//   @override
//   _MyAudioPlayerState createState() => _MyAudioPlayerState();
// }

// class _MyAudioPlayerState extends State<MyAudioPlayer> {
//   AudioPlayer audioPlayer = AudioPlayer();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Audio Player'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             IconButton(
//               icon: Icon(Icons.play_arrow),
//               onPressed: () {
//                 audioPlayer.play();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }