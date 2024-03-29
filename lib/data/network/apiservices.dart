import 'dart:convert';
import 'dart:io';
import 'package:adminservice/utils/appexceptions.dart';
import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;

typedef   EitherResponse<T>= Future <Either<AppException,T>>;
class ApiServices {
  static final _headers = {'Content-Type': 'application/json','Access-Control-Allow-Origin': 'header'};

  static EitherResponse<Map> postApi(var rawData, String url,[String? token]
     ) async {
       if(token!=null){
        _headers['autharization']=token;
       }

    Map fetchedData = {};
    final uri = Uri.parse(url);
    final body = jsonEncode(rawData);
    try {
      final response = await http.post(uri, body: body, headers: _headers);
      print(response.body);
      fetchedData = _getResponse(response);
      return Right(fetchedData);
    } on SocketException {
      print('socket ');
      return Left(InternetException());
    // } on http.ClientException {
    //   print('object $');
    //   return Left(RequestTimeOUtException());
    } catch (e) {
      print(e);
      return Left(BadRequestException());
    }
  }

  static EitherResponse getApi(String url, [String? userId , String? token]) async {
    final uri = Uri.parse(url);
    print('token $token');
    if(token!=null){
        _headers['autharization'] = token;
       }
    if (userId != null) {
      _headers['userId'] = userId;
    }
    dynamic fetchedData;
    try {
      print(_headers);
      final response = await http.get(uri, headers: _headers);
      print(response.body);
      fetchedData = _getResponse(response);
      return Right(fetchedData);
    } on SocketException {
      return Left(InternetException());
    } on http.ClientException {
      return Left(RequestTimeOUtException());
    } catch (e) {
      return Left(BadRequestException());
    }
  }

  // static EitherResponse<Map> patchApi(
  //     var userData, String url) async {
  //   final uri = Uri.parse(url);
  //   final body = jsonEncode(userData);
  //   // _headers['userId'] = token;
  //   Map<String, dynamic> fetchedData = {};
  //   try {
  //     final response = await http.patch(uri, body: body, headers: _headers);
  //     fetchedData = _getResponse(response);
  //   } on SocketException {
  //     return Left(InternetException());
  //   } on http.ClientException {
  //     return Left(RequestTimeOUtException());
  //   } catch (e) {
  //     return Left(BadRequestException());
  //   }
  //   return Right(fetchedData);
  // }


  static EitherResponse<Map> patchApi(
       String url,[String? token]) async {

        if(token!=null){
        _headers['autharization']= token;
       }
    final uri = Uri.parse(url);
   
    // _headers['userId'] = token;
    Map<String, dynamic> fetchedData = {};
    try {
      final response = await http.patch(uri, headers: _headers);
      fetchedData = _getResponse(response);
    } on SocketException {
      return Left(InternetException());
    } on http.ClientException {
      return Left(RequestTimeOUtException());
    } catch (e) {
      return Left(BadRequestException());
    }
    return Right(fetchedData);
  }
  static EitherResponse deleteApi(String url, String userId,[String? token]) async {
    if(token!=null){
        _headers['autharization']= token;
       }
    final uri = Uri.parse(url);
    _headers['userId'] = userId;
    dynamic fetchedData;

    try {
      final response = await http.delete(uri, headers: _headers);
      fetchedData = _getResponse(response);
      print(fetchedData.body);
      return Right(fetchedData);
    } on SocketException {
      return Left(InternetException());
    } on http.ClientException {
      return Left(RequestTimeOUtException());
    } catch (e) {
      return Left(BadRequestException());
    }
  }

  static _getResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return (jsonDecode(response.body));
      case 400:
        throw BadRequestException();
      default:
        throw BadRequestException();
    }
  }
}
