import 'package:flutter/cupertino.dart';
//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:misapp/base/baseresponse.dart';
import 'package:mis_app/datamodel/china.dart';
import 'package:mis_app/view/home.dart';
//import 'package:misapp/view/login.dart';
import 'package:mis_app/network/loginApi.dart';
import 'package:fluttertoast/fluttertoast.dart';


class loginController extends GetxController {

     final loginUserController = TextEditingController();
     final loginPwdController = TextEditingController();

     List<China> chinalist = [];
     List<Map<String,dynamic>> listmap = [];

    /* void loginChick(BuildContext context){
       if (loginEmailController.text.trim().isEmpty) {
         Fluttertoast.showToast(msg: "不能为空");
         return ;
       }
       loginApi().loginRequest('http://guolin.tech/api/china', errorCallback: (e) => {

       }).then((value) => {
         if (value.issuccess) {
           value.data.forEach((element) {
             chinalist.add(China.fromJson(element));
           }),

           if (chinalist[0].name.isNotEmpty)
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new Home())

         }
       }).whenComplete(() => {

       });
     }

     */
     void loginChick(BuildContext context){
       FocusScope.of(context).unfocus();
       if (loginUserController.text.trim().isEmpty) {
         Fluttertoast.showToast(msg: "不能为空");
         return ;
       }
       //Get.to(Home());
       //return;
       
       loginApi().loginRequest(
          'china',
          errorCallback: (e) => {},
        )
        .then((value) => {
              if (value.issuccess)
                {
                  //Fluttertoast.showToast(msg: "ok"),
                  Get.to(Home())
                }
            });
       
     }
     
}