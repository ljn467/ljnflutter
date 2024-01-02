/// id : 1
/// name : "北京"

class China {
  China({required int id, required String name,}){
    _id = id;
    _name = name;
  }

  int _id = 0;
  String _name = '';

  int get id => _id;
  String get name => _name;

  China.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}