import 'package:dio/dio.dart';

class ApiHelper{
  static Dio?dio;
  static init(){
    dio=Dio(BaseOptions(baseUrl:"http://mark.bslmeiyu.com/api/" ));
  }
  static  getData({ required String url}) async {
   return await dio?.get(url);
  }

}