// import 'dart:async';
//
// import 'package:internet_connection_checker/internet_connection_checker.dart';
//
// class ConnectionStatusSingleton extends GetxController with StateMixin {
//   final connectivity = 0.obs; //0 :1
//   late StreamSubscription<InternetConnectionStatus> _listenter;
//
//   @override
//   void onInit() {
//     connectivity.value = 1;
//     _listenter = InternetConnectionChecker().onStatusChange.listen(
//       (InternetConnectionStatus status) {
//         switch (status) {
//           case InternetConnectionStatus.connected:
//             connectivity.value = 1;
//             break;
//           case InternetConnectionStatus.disconnected:
//             connectivity.value = 0;
//             break;
//         }
//       },
//     );
//     super.onInit();
//   }
//
//   @override
//   void onClose() {
//     _listenter.cancel();
//     super.onClose();
//   }
// }
