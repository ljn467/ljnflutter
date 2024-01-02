
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:misapp/base/baseappbar.dart';
import 'package:mis_app/controller/loginController.dart';

// ignore: must_be_immutable
class Login extends StatefulWidget{
  Login({Key? key}) : super(key: key);

  loginController _controller = loginController();

  @override
  State<Login> createState() => _LoginState();
/*
  @override
  chickMenu() {

    DioUtil().get('http://guolin.tech/api/china', errorCallback: ((e){

    }
    )
    ).then((value) =>
    { //接受数据
      if ((value as baseresponse).issuccess) {
        (value as baseresponse).data.forEach((element) {
          chinalist.add(China.fromJson(element));
        })
      },
    }
    ).whenComplete(() => {

    });

  }
  */

}

class _LoginState extends State<Login> {
  FocusNode _focusNodeUser = new FocusNode();
  FocusNode _focusNodePwd = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        //appBar: BaseAppBar(hide: true),
        body: Center(
          
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(left: 80,top:0,right: 80,bottom: 20),
                child:new Image.asset('lib/images/logo.png',fit: BoxFit.fill)
            ),
            Padding(
              padding:const EdgeInsets.only(left: 80,top: 20,right: 80,bottom: 10),
              child: CupertinoTextField(
                controller: widget._controller.loginUserController,
                inputFormatters: [LengthLimitingTextInputFormatter(10)],
                keyboardType: TextInputType.text,
                cursorColor: Colors.green,
                placeholder: 'Enter User',
                focusNode: _focusNodeUser,
              ),
            ),
            Padding(
              padding:const EdgeInsets.only(left: 80,top: 10,right: 80,bottom: 10),
              child: CupertinoTextField(
                controller: widget._controller.loginPwdController,
                keyboardType: TextInputType.text,
                cursorColor: Colors.green,
                placeholder: 'Enter Password',
                focusNode: _focusNodePwd,
                obscureText: true,
              ),
            ),
            Padding(
                padding:const EdgeInsets.only(left: 80,top: 20,right: 80,bottom: 0),
                child:CupertinoButton(
                  child: Text('login'),
                  color: Colors.red,
                  onPressed: (){
                    widget._controller.loginChick(context);
                  },
                )
            ),

          ],
        ),
      ),
      );
  }
}
