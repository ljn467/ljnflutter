
//import 'package:fluttertoast/fluttertoast.dart';
import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mis_app/datamodel/user.dart';

import '../base/config.dart';

class baseDrawerController extends GetxController {

int opensubNum = -1;
int opensubIdex = -1;
var headerimg = null;

List<Map> basememu = [];
//List<Map> backupmemu = [];
baseDrawerController():super(){
   headerimg = getimage();
   basememu = getbaseList();
   
}

ExactAssetImage getimage(){
    var rng = new Random();
    return new ExactAssetImage(arrayimg[rng.nextInt(9)]);
  }

List<Map> getbaseList(){
  List<Map> base=[];
  for (var item in user().memulist) {
        Map temp = Map();
        temp['chickNum'] = '';
        temp['id'] = item['id'];
        temp['name'] = item['name'];
        if(item['sub'] != ''){
          if(item['sub'] == 's'){
             temp['type'] = 's';
          }else{
             temp['type'] = 'sub';
          }
        }else{
          temp['type'] = '';
        }
        base.add(temp);
      }
  return base;
}

void chickitem(int idex) {
       String temp = basememu[idex]['type'];
       if (temp.isNotEmpty) {
         //Fluttertoast.showToast(msg: 'chickitem:null');
         String num = basememu[idex]['chickNum'];
         if (num.isEmpty) {
           basememu[idex]['chickNum'] = idex.toString();
           //增加(先减少旧有的)
           if (opensubIdex > 0) {
             if (idex > opensubIdex) {
               idex = idex - opensubNum;
             }
             basememu = getbaseList();
           }
           List<Map> subMemuList = user().memulist[idex]['sub'];
           for (var i = 0; i < subMemuList.length; i++) {
             Map temp = Map();
             temp['chickNum'] = '';
             temp['id'] = subMemuList[i]['id'];
             temp['name'] = subMemuList[i]['name'];
             if(subMemuList[i]['sub'] != ''){
               if(subMemuList[i]['sub'] == 's'){
                  temp['type'] = 's';
               }else{
                  temp['type'] = 'sub';
               }
             }else{
                temp['type'] = '';
             }
             opensubNum = i+1;
             basememu.insert(idex + i + 1,temp );
           }
           opensubIdex = idex;
         }else{
           //减少
           
           basememu = getbaseList();
           opensubIdex = -1;
           opensubNum = -1;
           //basememu[idex]['chickNum'] = '';

         }
       }
       update(["DrawerUpdate"]);
  }

  void chickitem2(int idex) {
    if (opensubIdex > 0) {
      basememu = getbaseList();
      basememu[opensubIdex]['chickNum'] = '';
      opensubIdex = -1;
      opensubNum = -1;
      update(["DrawerUpdate"]);
    }
  }

 


}