import 'dart:io';

class InternetConnection {

  static InternetConnection _connection ;

  // is used to create only one instance from this class >>>>>
  static InternetConnection getInstance(){
    if(_connection == null){
      return _connection = InternetConnection() ;
    }
    return _connection ;
  }

  // is used to check if internet is connection or not
  Future<bool> checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true ;
      }
    } on SocketException catch (_) {
      return false ;
    }
    return false ;
  }
}