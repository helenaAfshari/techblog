
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:tecblog/controller/file_controller.dart';

Future pickFile()async{
  
  FilePickerController filePickerController = Get.put(FilePickerController());
  FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image );
  filePickerController.file.value = result!.files.first;
}

Future audioFile()async{
  
  FilePickerController filePickerController = Get.put(FilePickerController());
  FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.audio );
  filePickerController.file.value = result!.files.first;
}


  
