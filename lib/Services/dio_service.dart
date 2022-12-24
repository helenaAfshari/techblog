import 'dart:developer';


import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_service;
import 'package:get_storage/get_storage.dart';

import 'package:tecblog/constant/storage_const.dart';

class DioService {
  Dio dio = Dio();

  Future<dynamic> getMethod(String url) async {
    //اینجا نوع header را تعیین کردیم
    //برای این که بدونیم content-Typeچه جوری هست
    dio.options.headers['content-Type'] = 'application/json';

    //اینجا باید درخواستمون را ایجاد کنیم 
    return await dio
        .get(url,
            options: Options(responseType: ResponseType.json, method: 'GET'))
        .then((response) {
      log(response.toString()); 
      return response;
    }).catchError((err){
        if(err is DioError){
       
            return err.response!;

        }
    });
  }
      
 

  Future<dynamic> postMethod(Map<String, dynamic> map, String url) async {
    dio.options.headers['content-Type'] = 'application/json';
    
    var token = GetStorage().read(StorageKey.token);
    
    if(token!=null){
      dio.options.headers['authorization'] = '$token';
    }
            
  return await dio
        .post(url,
            data: dio_service.FormData.fromMap(map),
            options: Options(responseType: ResponseType.json, method: 'POST'))
        .then((response) {
      log(response.headers.toString());
      log(response.data.toString());
      log(response.statusCode.toString());
      return response;
    }).catchError((err){
      log(err.toString());
      if(err is DioError){
        return err.response!;
      }

    });
  }


}


