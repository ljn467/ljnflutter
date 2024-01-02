import 'package:mis_app/base/baseresponse.dart';
import 'package:mis_app/network/DioUtil.dart';

class absenceApi  {

  Future<baseresponse> absenceListRequest(String api, { Params, required Function errorCallback}) {

    return DioUtil().get(config.URL+api, pathParams:Params, errorCallback: errorCallback);

  }

  Future<baseresponse> absenceAddRequest(String api, { Params, required Function errorCallback}) {

    return DioUtil().post(config.URL+api, pathParams:Params, errorCallback: errorCallback);

  }
 


}