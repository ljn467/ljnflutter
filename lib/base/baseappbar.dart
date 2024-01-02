import 'package:flutter/material.dart';
import 'package:mis_app/base/config.dart';

abstract class BaseAppBarAction {
  chickMenu(); //抽象方法

}


// ignore: must_be_immutable
class BaseAppBar extends AppBar {
  bool hide = false;
  BaseAppBarAction? delegate;
  BaseAppBar({Key? key, required this.hide,this.delegate }) : super(key: key);

  @override
  _BaseAppBarState createState() => _BaseAppBarState();

}

class _BaseAppBarState extends State<BaseAppBar> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: bgColor,
        elevation: 0,
        title: Offstage(
            offstage: widget.hide,
            child: new Image.asset(logo,fit: BoxFit.fill),
        ),
        leading: Offstage(
          offstage: widget.hide,
          child: IconButton(
            icon: Icon(Icons.menu),
            onPressed: (){
              widget.delegate!.chickMenu();

            },
          ),
        ),
        actions:[
          IconButton(
            onPressed: (){},
            icon: const Text(''),
            //padding: EdgeInsets.only(right: 10, bottom: 10),
          ),
        ],
      ),
    );
  }


}