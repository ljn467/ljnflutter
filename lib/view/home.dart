
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mis_app/base/baseappbar.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:mis_app/base/baseDrawer.dart';
import 'package:mis_app/controller/homeController.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

class HomePage extends StatefulWidget{
  HomePage({Key? key}) : super(key: key);
  
  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> implements BaseAppBarAction {
  
  homeController _controller = homeController();
  var _scaffoldkey = new GlobalKey<ScaffoldState>();
  
  @override
  Widget build(BuildContext context) {
    MediaQueryData mq = MediaQuery.of(context);
    var h = mq.size.height;
    return Scaffold(
        backgroundColor: Colors.teal,
        key: _scaffoldkey,
        appBar: BaseAppBar(hide: false,delegate: this),
        drawer: BaseDrawer(delegate: _controller),
        body: WillPopScope(
        child:
        new SingleChildScrollView(
            child:new ConstrainedBox(
              constraints: new BoxConstraints(
                
                maxHeight: h-95,//680,
              ),
              child:
            GetBuilder<homeController>(
               init: _controller,
               id: "router",
               builder: (homeController controller){
                  return new Center(
                     child: controller.homeRouter(),
                  );
               },
            ),
        ),
        ),
        onWillPop: () async{return false; },
        )
    );
  }

  

  @override
  chickMenu() {
    _scaffoldkey.currentState?.openDrawer();
  }

  


}