class user{

  user._privateConstructor();

  static final user _instance = user._privateConstructor();

  factory user(){
    return _instance;
  }

  List memulist = [
    {'id':'AAA','name':'请假','sub':''},
    {'id':'BBB','name':'功能2','sub':[
      {'id':'BB1','name':'功能21','sub':'s'},
      {'id':'BB2','name':'功能22','sub':'s'},
      {'id':'BB3','name':'功能23','sub':'s'}
      ]
    },
    {'id':'CCC','name':'功能3','sub':''},
    {'id':'DDD','name':'功能4','sub':[
      {'id':'DD1','name':'功能41','sub':'s'},
      {'id':'DD2','name':'功能42','sub':'s'},
    ]
    },
    {'id':'EEE','name':'功能5','sub':[
      {'id':'EE1','name':'功能51','sub':'s'},
      {'id':'EE2','name':'功能52','sub':'s'},
    ]
    },
  ];

}