
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mis_app/controller/absenceController.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Absencemview {

  absenceController _controller;

  Absencemview(this._controller);



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
                  IconButton(
                    onPressed: (){
                      _controller.add_chick();
                    }, 
                    icon: Icon(Icons.input_sharp)
                    ),
                    IconButton(
                    onPressed: (){
                      _controller.refresh_chick();
                    }, 
                    icon: Icon(Icons.autorenew_sharp)
                    )
                ],
              ),
              new Divider(color: Colors.yellow[900],height:6,thickness: 4.0,indent: 8,endIndent: 8,),
              Expanded(
                child: ListView.builder(
                  /*itemBuilder: (BuildContext context, int index) {
                       return itemView(context, 'index:'+index.toString());
                  },*/
                  itemBuilder:(context,index) {
                    return  Slidable(
                      child: itemView(context, 'index:'+index.toString()),
                      endActionPane: ActionPane(
                        extentRatio: 0.2,
                        motion: DrawerMotion(),
                        children: [
                          SlidableAction(
                            // An action can be bigger than the others.
                            flex: 1,
                            onPressed: (e) async {_controller.touchaction(index);},
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            icon: Icons.delete_forever_outlined,
                            label: '撤销',
                          ),
                        ],
                      ),

                    );
                  },
                  itemCount: 50,
                ),
              ),
            ]
          )
        )
      );
  }

  //listviewcell式样
  Widget itemView(BuildContext context,String str){
    return SizedBox(
      width: window.physicalSize.width,
      height: 90,
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
            children:<Widget>[
            Row(
              children: [
                Text('假单号：',style: TextStyle(fontWeight: FontWeight.bold),),Text('2022090801'),SizedBox(width: 42),Text('天数：',style: TextStyle(fontWeight: FontWeight.bold)),Text('0.5天')
              ],
            ),
            new Divider(color: Colors.cyan, height: 4,thickness: 1,indent: 3,endIndent: 3,),
            Row(
              children: [
                Text('审核：',style: TextStyle(fontWeight: FontWeight.bold)),Text('已通过'),SizedBox(width: 100),Text('状态：',style: TextStyle(fontWeight: FontWeight.bold)),Text('正常')
              ],
            ),
            new Divider(color: Colors.cyan,height: 4,thickness: 1,indent: 3,endIndent: 3,),
            Row(
              children: [
                Text('时间：',style: TextStyle(fontWeight: FontWeight.bold)),Text('20220103~20220104')
              ],
            ), 
          ],
        )
      )
    )
    );
  }

}