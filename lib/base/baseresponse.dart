
enum DataType {
  MAP,
  LIST,
  STRING,
  NIL
}

class baseresponse {
  baseresponse({required int? statusCode,
                required dynamic data,
                required DataType datatype,
                required bool issuccess}){
    _statusCode = statusCode;
    _data = data;
    _dataType = datatype;
    _issuccess = issuccess;
  }

  int? _statusCode = 0;
  dynamic _data = '';
  DataType _dataType = DataType.NIL;
  bool _issuccess = false;

  int? get id => _statusCode;
  dynamic get data => _data;
  bool get issuccess => _issuccess;
  DataType get dataType =>  _dataType;
}