//import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:mis_app/base/baseresponse.dart';
import 'package:mis_app/base/config.dart';
class config {
  static final String URL = apiURL;
}
class Method {
  static final String get = "GET";
  static final String post = "POST";
  static final String put = "PUT";
  static final String head = "HEAD";
  static final String delete = "DELETE";
  static final String patch = "PATCH";
}

class DioUtil {
  static final DioUtil _instance = DioUtil._init();
  static Dio? _dio;
  //static BaseOptions _options = getDefOptions();

  factory DioUtil() {
    return _instance;
  }

  DioUtil._init() {
    _dio = new Dio();
  }

  /*static BaseOptions getDefOptions() {
    BaseOptions options = BaseOptions();
    //options.baseUrl = 'http://guolin.tech/api/';
    options.connectTimeout = 10 * 1000;
    options.receiveTimeout = 20 * 1000;
    //options.contentType = ContentType.parse('application/x-www-form-urlencoded') as String?;

    Map<String, dynamic> headers = Map<String, dynamic>();
    headers['Accept'] = 'application/json';

    //String platform;
    if(Platform.isAndroid) {
      //platform = "Android";
      headers['OS'] = "Android";
    } else if(Platform.isIOS) {
      //platform = "IOS";
      headers['OS'] = "IOS";
    }
    //headers['OS'] = platform;
    options.headers = headers;

    return options;
  }*/

  /*setOptions(BaseOptions options) {
    _options = options;
    _dio?.options = _options;
  }*/

  Future<baseresponse> get(String path, { pathParams, data, required Function errorCallback}) {
    return request(path, method: Method.get, pathParams: pathParams, data: data, errorCallback: errorCallback);
  }

  Future<baseresponse> post(String path, { pathParams, data, required Function errorCallback}) {
    return request(path, method: Method.post, pathParams: pathParams, data: data, errorCallback: errorCallback);
  }

  Future<baseresponse> request(String path,{required String method, required Map<String, dynamic>? pathParams, data, required Function errorCallback}) async {
    ///restful请求处理
    if(pathParams != null) {
      pathParams.forEach((key, value) {
        if(path.indexOf(key) != -1) {
          path = path.replaceAll(":$key", value.toString());
        }
      });
    }

    Response response = await _dio!.request(path, data: data, options: Options(method: method));
    if(response.statusCode == HttpStatus.ok || response.statusCode == HttpStatus.created) {
      /*try {
        if(response.data is Map) {
          return response.data;
        } else {
          return json.decode(response.data.toString());
        }
      } catch(e) {

        return {'catch':'catch'};
      }*/
      //print('response:$response');
      /*Fluttertoast.showToast(
          msg: response.toString(),
          toastLength: Toast.LENGTH_LONG,
          timeInSecForIosWeb: 1
      );*/
      DataType datatype = DataType.STRING;
      if (response.data is Map) {
         datatype = DataType.MAP;
      } else if (response.data is List) {
         datatype = DataType.LIST;
      }
      return baseresponse(statusCode: response.statusCode, data: response.data, datatype: datatype, issuccess: true);
    } else {
      _handleHttpError(response.statusCode);
      if(errorCallback != {}) {
        errorCallback(baseresponse(statusCode: response.statusCode, data: response.data, datatype: DataType.NIL, issuccess: false));
      }
      return baseresponse(statusCode: response.statusCode, data: '', datatype: DataType.NIL, issuccess: false);

    }

  }

  ///处理Http错误码
  void _handleHttpError(int? errorCode) {

  }
  /*void get(String path, {pathParams, data,required Function successCallback, required Function errorCallback}) {
    request(path, method: Method.get, pathParams: pathParams, data: data, successCallback: successCallback, errorCallback: errorCallback);
  }

  void request(String path,{required String method, required Map<String, dynamic>? pathParams, data, required Function successCallback, required Function errorCallback}) async {
    Response response = await _dio!.request(path,data: data,queryParameters: pathParams,options: Options(method: method));
    if(response.statusCode == HttpStatus.ok || response.statusCode == HttpStatus.created) {
      if(successCallback != {}) {
        successCallback(response.data);
      }
    }else{
      if(errorCallback != {}) {
        errorCallback(response.statusCode);
      }
    }
  }*/
}