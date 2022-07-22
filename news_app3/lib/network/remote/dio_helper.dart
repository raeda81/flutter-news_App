
import 'dart:ffi';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper {
 static Dio ? dio ;

//when we run the application  and call ( dio.init ) it will declare "dio"
 static init(){
  dio = Dio(    BaseOptions(
   baseUrl:'https://newsapi.org/',
   receiveDataWhenStatusError: true , // even if their is an error in the data receive and show it
  )   );
 }



static Future<Response> getData({ //1 Future<Response> added       //2 static added
 required String url ,
 required Map <String,dynamic>  query })
async {
 return await dio!.get( url , queryParameters: query  ) ;
 // the get we are using here is a return a future <Response> so we have witten it in
 //but also we are using Dio which is initially is a STATIC so we have to write it to enable the code to see it while run
}



 }



