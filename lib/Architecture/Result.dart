import 'dart:ffi';

class Result<T>{
  T? data;
  String? exception;

  bool isSuccess(){
    return data != null;
  }

  static Result error(String s){
    Result<String> result = Result();
    result.exception  = s;
    return result;
  }





  static Result<T> success<T>(T data){
    Result<T> result = Result();
    result.data = data;
    return result;
  }


}