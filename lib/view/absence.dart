
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mis_app/controller/absenceController.dart';

class Absence extends StatefulWidget{
  @override
  State<Absence> createState() => _AbsenceState();
  
}


class _AbsenceState extends State<Absence> {

  absenceController _controller = absenceController();

  @override
  Widget build(BuildContext context) {
    _controller.current = '';
    return  GetBuilder<absenceController>(
                    init: _controller,
                    id: "ViewUpdate", 
                    builder: (absenceController controller) {
                      return controller.mainView(context);
                    });
    
  }


}



