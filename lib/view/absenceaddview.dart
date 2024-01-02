import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mis_app/controller/absenceController.dart';

class Absenceaddview  {

  absenceController _controller;

  Absenceaddview(this._controller);

  Decoration boxDecoration(){
    return BoxDecoration(
          image: new DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("lib/images/bkimg_check.png"),
          ),
        );
  }

  Widget build(BuildContext context) {
    return Container(
        decoration: boxDecoration(),
        child: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:<Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('请假申请 ',style: TextStyle(color: Colors.blue,fontSize: 30.0),),
                  IconButton(onPressed: (){_controller.save_chick();}, icon: Icon(Icons.save)),
                  IconButton(onPressed: (){_controller.back_chick();}, icon: Icon(Icons.backspace))
                ],
              ),
              new Divider(color: Colors.yellow[900],height:6,thickness: 4.0,indent: 8,endIndent: 8,),
              SizedBox(
                width: window.physicalSize.width,
                height: 435,
                child:Container(
                  margin:EdgeInsets.all(4.0),
                  decoration:BoxDecoration(
                    color: Colors.white60,
                    border: Border.all(color: Colors.white60, width: 1),//边框
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                    ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text('员工编号：',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                            Expanded(
                              child: CupertinoTextField(
                                    style: TextStyle(fontSize: 15),
                                    keyboardType: TextInputType.text,
                                    placeholder: 'B00224/吕建库',
                                    readOnly: true, 
                                    onTap: (){
                                      //Fluttertoast.showToast(msg: '员工编号');
                                    },
                                  ),
                            )
                          ],
                        ),
                        new Divider(color: Colors.cyan, height: 20,thickness: 1,indent: 3,endIndent: 3,),
                        Row(
                          children: [
                            Text('起始时间：',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                            Expanded(
                              child: CupertinoTextField(   
                                    controller: _controller.startDateController,
                                    style: TextStyle(fontSize: 15),
                                    keyboardType: TextInputType.text,
                                    placeholder: '2022-01-10',
                                    readOnly: true, 
                                    onTap: (){
                                      _controller.onClickDate(context, 1);
                                    },
                                  ),
                            ),
                            SizedBox(width: 10,),
                            SizedBox(
                                width: 70,
                                child:
                               CupertinoTextField(   
                                    controller: _controller.startHalfController,
                                    style: TextStyle(fontSize: 15),
                                    keyboardType: TextInputType.text,
                                    placeholder: '上午',
                                    readOnly: true, 
                                    onTap: (){
                                      _controller.onClickHalf(context, 1);
                                    },
                                  ),
                              ),
                           
                          ],
                        ),
                        new Divider(color: Colors.cyan, height: 20,thickness: 1,indent: 3,endIndent: 3,),
                        Row(
                          children: [
                            Text('结束时间：',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                            Expanded(
                              child: CupertinoTextField(
                                    controller: _controller.endDateController,
                                    style: TextStyle(fontSize: 15),
                                    keyboardType: TextInputType.text,
                                    placeholder: '20220111',
                                    readOnly: true, 
                                    onTap: (){
                                      //Fluttertoast.showToast(msg: '结束时间');
                                      _controller.onClickDate(context,2);
                                    },
                                  ),
                            ),
                            SizedBox(width: 10,),
                            SizedBox(
                                width: 70,
                                child:
                               CupertinoTextField(
                                    controller: _controller.endHalfController,
                                    style: TextStyle(fontSize: 15),
                                    keyboardType: TextInputType.text,
                                    placeholder: '上午',
                                    readOnly: true, 
                                    onTap: (){
                                      _controller.onClickHalf(context, 2);
                                    },
                                  ),
                              ),     
                          ],
                        ),
                        new Divider(color: Colors.cyan, height: 20,thickness: 1,indent: 3,endIndent: 3,),
                        Row(
                          children: [
                            Text('请假天数：',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                            Expanded(
                              child: CupertinoTextField(
                                    controller: _controller.daysController,
                                    style: TextStyle(fontSize: 15),
                                    keyboardType: TextInputType.text,
                                    placeholder: '0.5天',
                                    //readOnly: true, 
                                    onTap: (){
                                      //Fluttertoast.showToast(msg: '请假天数');
                                      //onClick();
                                    },
                                  ),
                            ),
                            SizedBox(
                              height: 40,
                              width: 40,
                              child:IconButton( onPressed: (){_controller.onClick();}, icon: Icon(Icons.lock_clock_outlined))
                            ),
                            Text('类别：',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                            Expanded(
                              child: CupertinoTextField(
                                    controller: _controller.typeController,
                                    style: TextStyle(fontSize: 15),
                                    keyboardType: TextInputType.text,
                                    placeholder: '',
                                    readOnly: true, 
                                    onTap: (){
                                      //Fluttertoast.showToast(msg: '请假天数');
                                      _controller.onClickType(context);
                                    },
                                  ),
                            ),
                          ],
                        ),
                        new Divider(color: Colors.cyan, height: 20,thickness: 1,indent: 3,endIndent: 3,),
                        Row(
                          children: [
                            Text('请假事由：',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                            Expanded(
                              child: CupertinoTextField(
                                    style: TextStyle(fontSize: 15),
                                    keyboardType: TextInputType.text,
                                    placeholder: '小孩生病',
                                    //readOnly: true, 
                                    /*onTap: (){
                                      Fluttertoast.showToast(msg: '请假天数');
                                    },*/
                                  ),
                            ),
                            
                          ],
                        ),
                        new Divider(color: Colors.cyan, height: 20,thickness: 1,indent: 3,endIndent: 3,),
                        Row(
                          children: [
                            Text('职代1：',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                            Expanded(
                              child: CupertinoTextField(
                                    controller: _controller.employee1Controller,
                                    style: TextStyle(fontSize: 15),
                                    keyboardType: TextInputType.text,
                                    placeholder: 'B00224/吕建低',
                                    readOnly: true, 
                                    onTap: (){
                                      _controller.onClickEmployee(context, 1);
                                    },
                                  ),
                            ),
                            
                          ],
                        ),
                        new Divider(color: Colors.cyan, height: 20,thickness: 1,indent: 3,endIndent: 3,),
                        Row(
                          children: [
                            Text('职代2：',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                            Expanded(
                              child: CupertinoTextField(
                                    controller: _controller.employee2Controller,
                                    style: TextStyle(fontSize: 15),
                                    keyboardType: TextInputType.text,
                                    placeholder: 'B00224/吕建n',
                                    readOnly: true, 
                                    onTap: (){
                                      _controller.onClickEmployee(context, 2);
                                    },
                                  ),
                            ),
                          ],
                        ),
                        new Divider(color: Colors.cyan, height: 20,thickness: 1,indent: 3,endIndent: 3,),
                        Row(
                          mainAxisAlignment:  MainAxisAlignment.center,
                          children: [
                            Text('申请时间：',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                            Expanded(
                              child: CupertinoTextField(
                                    style: TextStyle(fontSize: 15),
                                    keyboardType: TextInputType.text,
                                    placeholder: '2022-1-11:13:30:00',
                                    readOnly: true, 
                                    onTap: (){
                                      //Fluttertoast.showToast(msg: '申请时间');
                                    },
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ),
            ]
          )
        )
      );
  }
}