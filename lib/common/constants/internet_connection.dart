import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:data_connection_checker_tv/data_connection_checker.dart';

class InternetConnection {
  bool? isConnected;

  Future<bool?> isOnline() async {
    try {
      final List<InternetAddress> result =
          await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isConnected = true;
      }
    } on SocketException catch (_) {
      isConnected = false;
    }
    return isConnected;
  }
}

class CheckInternetConnection {
  Future<bool> isInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
// // I am connected to a mobile network, make sure there is actually a net connection.
//       if (await DataConnectionChecker().hasConnection) {
// // Mobile data detected & internet connection confirmed.
//         return true;
//       } else {
// // Mobile data detected but no internet connection found.
//         return false;
//       }
    } else if (connectivityResult == ConnectivityResult.wifi) {
      try {
        final List<InternetAddress> result =
            await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          return true;
        } else {
          return false;
        }
      } on SocketException catch (_) {
        return false;
      }
    } else {
// Neither mobile data or WIFI detected, not internet connection found.
      return false;
    }
  }
}
