
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pickers/pickers.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:mis_app/view/absencemview.dart';
import 'package:mis_app/view/absenceaddview.dart';

class absenceController extends GetxController {

  var current = '';
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController startHalfController = TextEditingController();
  TextEditingController endHalfController = TextEditingController();
  TextEditingController employee1Controller = TextEditingController();
  TextEditingController employee2Controller = TextEditingController();
  TextEditingController daysController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  
  DateTime startdate = DateTime.now();
  DateTime enddate = DateTime.now();

  Widget mainView(BuildContext context) {
    if (current.isEmpty) {
      return Absencemview(this).build(context);//mView(context);
    }
    return Absenceaddview(this).build(context);//addView(context);
  }

  /**********************选择器**********************/
  void onClickDate(BuildContext context,int i){
     Pickers.showDatePicker(
       context,
       onConfirm: (p) {
         
         if (i == 1) {
            startDateController.text = ''+p.year.toString()+'-'+p.month.toString()+'-'+p.day.toString();
            startdate = DateTime(p.year!,p.month!,p.day!);
         }else{
            endDateController.text = ''+p.year.toString()+'-'+p.month.toString()+'-'+p.day.toString();
            enddate = DateTime(p.year!,p.month!,p.day!);
         }
       }
     );
  }

  void onClickHalf(BuildContext context,int i){
    var datadic = ['上午', '下午'];
    Pickers.showSinglePicker(
      context,  
      data: datadic,
      onConfirm: (p, position) {
        if (i == 1) {
          startHalfController.text = datadic[position];
        }else{
          endHalfController.text = datadic[position];
        }
      }
    );
  }
  
  void onClick(){
    int days = enddate.difference(startdate).inDays;
    //Fluttertoast.showToast(msg: "天数：$days");
    double halfday = 0.0;
    if(startHalfController.text == '上午' && endHalfController.text == '上午'){
      halfday = 0.5;
    }else if (startHalfController.text == '上午' && endHalfController.text == '下午') {
      halfday = 1.0;
    }else if (startHalfController.text == '下午' && endHalfController.text == '下午') {
      halfday = 0.5;
    }else if (startHalfController.text == '下午' && endHalfController.text == '上午') {
      halfday = 0.0;
    }

    double numdays = days + halfday;

    if (numdays == 0.0 || startHalfController.text == '' || endHalfController.text == '') {
      Fluttertoast.showToast(msg: '请检查起始结束时间设定！');
      return;
    }
    daysController.text = '$numdays';

  }


  void onClickEmployee(BuildContext context,int i){
    var datadic = ['B00221/张三', 'B0220/李五','B0220/李六','B0220/李七','B0220/李八','B0220/李九','B0220/李十'];
    Pickers.showSinglePicker(
      context,  
      data: datadic,
      onConfirm: (p, position) {
        if (i == 1) {
          employee1Controller.text = datadic[position];
        }else{
          employee2Controller.text = datadic[position];
        }
      }
    );
  }

  void onClickType(BuildContext context){
    var datadic = ['事假', '产假','病假'];
    Pickers.showSinglePicker(
      context,  
      data: datadic,
      onConfirm: (p, position) {
        typeController.text = datadic[position];
      }
    );
  }

  /**********************点击事件*******************/
  void add_chick() {
    if (current.isEmpty) {
      current = 'add';
      update(['ViewUpdate']);
    }
  }

  void refresh_chick() {
    if (current.isEmpty) {
      current = '';
      //刷新，重新获取listview。
      update(['ViewUpdate']);
    }
  }

  void save_chick() {
    if (current.isNotEmpty) {
      current = '';
      //新增请假请求处理


      update(['ViewUpdate']);
    }
  }

  void back_chick() {
    if (current.isNotEmpty) {
      current = '';
      update(['ViewUpdate']);
    }
  }

  void touchaction(int index){
    Fluttertoast.showToast(msg: "hello! ${index}");
  }
}
