//import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:mis_app/base/baseDrawer.dart';
import 'package:mis_app/view/absence.dart';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class homeController extends GetxController implements BaseDrawerAction {
  String _itemId = 'default';
  @override
  chickMenuItem(String itemId) {
      _itemId = itemId;
      update(["router"]);
  }

  @override
  chickSignOut() {
    //请求登出，返回login画面
    Get.back();
  }

  Widget homeRouter(){
    switch (_itemId) {
      case 'default':
        //return Text('欢迎来到MIS世界！',style: TextStyle(color: Colors.white,fontSize: 25.0,fontStyle: FontStyle.italic));
        return Absence();
        //break;
      case 'AAA':
        return Absence();
        //break;
      case 'C':
        
        break;
      //default: 
      //  return defaultFunction();
    }
    return defaultFunction();
  }

  Widget defaultFunction() {
    return Text('暂不支持此功能！',style: TextStyle(color: Colors.white,fontSize: 25.0,fontStyle: FontStyle.italic));
  }


}