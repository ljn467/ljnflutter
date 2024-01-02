import 'package:mis_app/base/baseresponse.dart';
import 'package:mis_app/network/DioUtil.dart';

class generalApi  {

  Future<baseresponse> employeeRequest(String api, { Params, required Function errorCallback}) {

    return DioUtil().get(config.URL+api, pathParams:Params, errorCallback: errorCallback);

  }

}