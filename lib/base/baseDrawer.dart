

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mis_app/controller/baseDrawerController.dart';
import 'package:mis_app/base/config.dart';

abstract class BaseDrawerAction {
  chickMenuItem(String itemId); //抽象方法
  chickSignOut();
}

// ignore: must_be_immutable
class BaseDrawer extends StatefulWidget {
  BaseDrawerAction? delegate;
  
  BaseDrawer({Key? key, this.delegate}) : super(key: key);

  baseDrawerController _controller = baseDrawerController();

  List<Widget> listitem(BuildContext context) {
    List<Widget> listTemp = [];
    
    for (var i = 0; i < _controller.basememu.length; i++) {
      listTemp.add(listTile(context, i));
      listTemp.add(
        new Divider(height: 8,) //分割线控件
      );
    }

    listTemp.add(
      new ListTile(
          //退出按钮
          title: new Text('Close',style: TextStyle(color: Colors.white)),
          trailing: new Icon(Icons.cancel,color: Colors.white,),
          onTap: () => {
                Navigator.of(context).pop(),
                delegate?.chickSignOut(),
              } //点击后收起侧边栏
          ),
    );

    return listTemp;
  }

  ListTile listTile(BuildContext context, int idex) {
    String name = (_controller.basememu[idex])["name"];
    String? type = (_controller.basememu[idex])["type"];
    String id = (_controller.basememu[idex])["id"];
    if (type == 's') {
      return new ListTile(
        leading:new Text(''),
        title: new Text(name,style: TextStyle(color: Colors.white),),
        trailing: new Icon(Icons.arrow_forward_ios_sharp,color: Colors.white,),
        onTap: () => {
                  Navigator.of(context).pop(),
                  delegate?.chickMenuItem(id)
            });
    }
    return new ListTile(
        title: new Text(name,style: TextStyle(color: Colors.white),),
        trailing: new Icon(Icons.arrow_forward_ios_sharp,color: Colors.white),
        onTap: () => {
              if (type == '')
                {
                  _controller.chickitem2(idex),
                  Navigator.of(context).pop(),
                  delegate?.chickMenuItem(id)
                }
              else
                {_controller.chickitem(idex)}
            });
  }

  Widget drawerView(BuildContext context) {
    return new ListView(
      padding: EdgeInsets.only(top: 0),
      shrinkWrap: true,
      children: listitem(context)
      );
  }

  @override
  State<StatefulWidget> createState() => _BaseDrawerState();
}

class _BaseDrawerState extends State<BaseDrawer> {
  @override

  Widget build(BuildContext context) {
    return Container(
        width: drawerWidth,
        child: new Drawer(
          backgroundColor: drawerBgColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 0, top: 32, right: 0, bottom: 0),
                child: Container(
                    width: 235,
                    height: 235 * 0.7,
                    child: new UserAccountsDrawerHeader(
                      accountName: new Text('吕建宁'), //用户名
                      accountEmail: new Text('欢迎您的到来！'),
                      decoration: new BoxDecoration(
                        //用一个BoxDecoration装饰器提供背景图片
                        image: new DecorationImage(
                          fit: BoxFit.fill,
                          // image: new NetworkImage('https://raw.githubusercontent.com/flutter/website/master/_includes/code/layout/lakes/images/lake.jpg')
                          //可以试试图片调取自本地。调用本地资源，需要到pubspec.yaml中配置文件路径
                          image: widget._controller.headerimg
                        ),
                      ),
                    )
                  ),
              ),
              Expanded(
                child: GetBuilder<baseDrawerController>(
                    init: widget._controller,
                    id: "DrawerUpdate",
                    builder: (baseDrawerController controller) {
                      return widget.drawerView(context);
                      /*new ListView(
                          padding: EdgeInsets.only(top: 0),
                          shrinkWrap: true,
                          children: widget.listitem(context));*/
                    }),
              )
            ],
          ),
        )
      );
  }

}
