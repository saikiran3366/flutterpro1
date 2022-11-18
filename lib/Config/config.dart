// import 'dart:convert';

// import 'package:cached_network_image/src/cached_image_widget.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:intl/intl.dart';
// import 'package:pmaccsemployeeportal/Config/Framework.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:url_launcher/url_launcher_string.dart';

// const String PRIVATE_KEY = 'ivxKva5C7rIf8yE0YrF8ivxKva5C7rIf8yE0YrF8';
// const ENVIRONMENT = ENVIRONMENTS.DEVELOPMENT;

// // const String BASE_URL = 'https://api.peoplescooperative.info/employeeportal/';

// final String BASE_URL = ENVIRONMENT == ENVIRONMENTS.PRODUCTION
//     ? 'https://api.peoplescooperative.info/employeeportal/'
//     : 'http://192.168.15.108:4000/employeeportal/';
// // : 'http://103.99.109.115:4000/employeeportal/';

// const String PROJECT_CODE = "emp-portal";
// // ------------------- Mode Operation ----------
// // const ENVIRONMENT = ENVIRONMENTS.PRODUCTION;

// log(dynamic value) {
//   if (ENVIRONMENT == ENVIRONMENTS.DEVELOPMENT) {
//     print("$value");
//   }
// }

// enum ENVIRONMENTS { DEVELOPMENT, PRODUCTION }

// //---------------- Error MSG Throw -----------------------
// Function showError = (value) {
//   if (value == null || value == "") {
//     return "Required field*";
//   }
// };
// const debug = true;

// indianCur(int value) {
//   return NumberFormat.currency(locale: 'HI')
//       .format(value)
//       .replaceAll('INR', '')
//       .replaceAll('.00', '');
// }

// Widget recordsLength({int length, Color textColor}) {
//   return Container(
//     margin: EdgeInsets.only(right: Get.width * 0.02),
//     child: Center(
//         child: Container(
//             padding: EdgeInsets.all(5.0),
//             decoration: BoxDecoration(
//               // shape: BoxShape.circle,
//               borderRadius: BorderRadius.circular(5),
//               color: Colors.blue,
//             ),
//             child: Text(
//               "$length",
//               style: TextStyle(
//                 fontSize: 14.0,
//                 color: textColor ?? Colors.white,
//                 fontWeight: FontWeight.w700,
//               ),
//             ))),
//   );
// }

// loadingProgress(context, {String msg}) {
//   dialogContext(context,
//       body: SizedBox(
//         height: Get.width * 0.2,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             CircularProgressIndicator(),
//             Text(
//               msg ?? 'Data Processing... ',
//               style: headerText(),
//             )
//           ],
//         ),
//       ),
//       actionButtons: [
//         const SizedBox(
//           height: 0,
//         )
//       ]);
// }

// // --------------------- Pop-up Alert Dialog Messages -----------------------
// void snackBar(
//     {String title,
//     dynamic msg,
//     int durations,
//     Color bgcolor,
//     SnackPosition snackPosition}) {
//   Get.snackbar(title, msg,
//       backgroundColor: bgcolor ?? Colors.white,
//       snackPosition: snackPosition ?? SnackPosition.BOTTOM,
//       messageText: Text(
//         msg,
//         style: GoogleFonts.roboto(
//             textStyle: TextStyle(
//                 color: Colors.black87,
//                 fontSize: Get.width * 0.028,
//                 wordSpacing: 3,
//                 letterSpacing: 0.5,
//                 fontWeight: FontWeight.bold)),
//       ),
//       animationDuration: Duration(milliseconds: 600),
//       margin: EdgeInsets.only(bottom: 25, left: 10, right: 10),
//       progressIndicatorBackgroundColor: Colors.black,
//       isDismissible: false,
//       duration: Duration(seconds: durations ?? 2),
//       borderRadius: 12,
//       forwardAnimationCurve: Curves.fastOutSlowIn,
//       snackStyle: SnackStyle.FLOATING,
//       showProgressIndicator: false,
//       titleText: Text(
//         title,
//         style: GoogleFonts.roboto(
//             textStyle: TextStyle(
//                 color: Colors.black,
//                 wordSpacing: 3,
//                 letterSpacing: 0.5,
//                 fontSize: Get.width * 0.035,
//                 fontWeight: FontWeight.bold)),
//       ));
// }

// appLogout(context) {
//   dialogContext(context,
//       title: Text(
//         "Are you sure want to Logout ?",
//         style: headerText(fontSize: Get.width * 0.035),
//       ),
//       // body:  Container(
//       //   alignment: Alignment.center,
//       //   height: Get.width * 0.1,
//       //   width: Get.width * 0.7,
//       //   child: Text(
//       //     'Are you sure want to Logout ?',
//       //     style: basicText(),
//       //   ),
//       // ),
//       actionButtons: <Widget>[
//         Row(
//           mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             PressButton(
//               color: Colors.blueAccent,
//               child: Text(
//                 'Cancel',
//                 style: basicText(color: Colors.white),
//               ),
//               onPressed: () {
//                 Get.back();
//               },
//             ),
//             SizedBox(
//               width: Get.width * 0.03,
//             ),
//             PressButton.icon(
//               padding: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
//               icon: Icon(
//                 Icons.logout,
//                 color: Colors.white,
//                 size: Get.width * 0.05,
//               ),
//               color: Colors.red,
//               label: Text('Logout', style: basicText(color: Colors.white)),
//               onPressed: () async {
//                 await deleteStorage();
//                 Get.offAllNamed("/LoginScreen");
//               },
//             )
//           ],
//         ),
//       ]);

//   // Get.defaultDialog(
//   //   title: "Logout",
//   //   titleStyle: anyBoldText(0.045, Colors.black),
//   //   content: Container(
//   //     alignment: Alignment.center,
//   //     height: Get.width * 0.1,
//   //     width: Get.width * 0.7,
//   //     child: Text(
//   //       'Are You Sure Want to Logout ?',
//   //       style: basicText(),
//   //     ),
//   //   ),
//   //   barrierDismissible: false,
//   //   actions: <Widget>[
//   //     Row(
//   //       mainAxisSize: MainAxisSize.max,
//   //       mainAxisAlignment: MainAxisAlignment.end,
//   //       children: [
//   //         PressButton(
//   //           child: Text(
//   //             'CANCEL',
//   //             style: anyBoldText(0.03, Colors.blue),
//   //           ),
//   //           onPressed: () {
//   //             Get.back();
//   //           },
//   //         ),
//   //         PressButton(
//   //           child: Text('YES', style: anyBoldText(0.03, Colors.blue)),
//   //           onPressed: () async {
//   //             await deleteStorage();
//   //             Get.offAllNamed("/LoginScreen");
//   //           },
//   //         )
//   //       ],
//   //     ),
//   //   ],
//   // );
// }

// Future<void> alertMsgDialogWithContext(BuildContext context,
//     {Widget title,
//     body,
//     Color bgColor,
//     double elevation,
//     var actionButtons,
//     var setState,
//     bool barrierDismissible}) async {
//   showDialog(
//       context: context,
//       barrierDismissible: barrierDismissible ?? true,
//       builder: (context) => StatefulBuilder(
//           builder: (context, setState) => AlertDialog(
//                 title: title,
//                 backgroundColor: bgColor,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20)),
//                 elevation: elevation ?? 2,
//                 content: body,
//                 actions: actionButtons,
//               )));
// }

// alertMsgDialog(
//     {String title, Widget body, var actions, bool barrierDismissible}) {
//   Get.defaultDialog(
//     title: title ?? "Alert",
//     titleStyle: anyText(0.04, Colors.black, FontWeight.bold),
//     content: Container(
//       alignment: Alignment.center,
//       width: Get.width * 0.7,
//       child: body,
//     ),
//     barrierDismissible: barrierDismissible ?? false,
//     actions: actions,
//   );
// }

// //-------------- Colors -------------------------
// const LITE_RED = Color(0xffc76184);
// const MIDDLE_RED = Color(0xff935072);
// const DARK_RED = Color(0xff553d5e);
// const active = Color(0xffB6F5D2);
// const comp = Color(0xffFF7CC59);

// const GRADIENT = [LITE_RED, MIDDLE_RED, DARK_RED];
// LinearGradient linearGradient = LinearGradient(
//     colors: GRADIENT, begin: Alignment.topCenter, end: Alignment.bottomCenter);

// const LIGHT_BLUE = Color(0xff3f8fce);
// const MIDDILE_BLUE = Color(0xff3270ad);
// const DARK_BLUE = Color(0xff173772);
// const PMACCS_GRAY = Color(0xffaeb0b2);
// const PMACCS_BLUE = Color(0xff2584c5);
// const BGCOLOR = Color(0xfff2f4f7);
// const NOTIFYICON_COLOR = Color(0xffbcc5d3);
// const ICONS_BGCOLOR = Color(0xfff6f7f9);
// const ICONSCOLOR = Color(0xff7f97c4);
// const DARKBLUE_TEXTCOLOR = Color(0xff224b76);
// const PRODUCTS_BGGRADIENT_COLOR = [
//   Color(0xff4566a9),
//   Color(0xff29529f),
//   Color(0xff1c4b9a)
// ];

// const GRADIENT_COLORS = [LIGHT_BLUE, MIDDILE_BLUE, DARK_BLUE];
// const LINEAR_GRADIENT_BUTTON = LinearGradient(
//     begin: Alignment.centerLeft,
//     colors: GRADIENT_COLORS,
//     end: Alignment.centerRight);
// const LINEAR_GRADIENT = LinearGradient(
//     begin: Alignment.topLeft,
//     colors: GRADIENT_COLORS,
//     end: Alignment.bottomLeft);
// const PRODUCTS_LINEAR_GRADIENT = LinearGradient(
//     begin: Alignment.topLeft,
//     colors: PRODUCTS_BGGRADIENT_COLOR,
//     end: Alignment.bottomRight);
// const LITEBLUE_CARDBG = Color(0xffebefff);
// const DARKBLUEHEADER_TEXT = Color(0xff0624a3);
// const greyBAck = Color(0xffD6D6D6);

// // ----------------------- Text Styles ----------------------------
// TextStyle anyText(double fSize, Color colors, FontWeight fontWeight) {
//   return GoogleFonts.roboto(
//       textStyle: TextStyle(
//     fontSize: Get.width * fSize,
//     color: colors,
//     fontStyle: FontStyle.normal,
//     fontWeight: fontWeight,
//     letterSpacing: 0.2,
//     wordSpacing: 2.5,
//   ));
// }

// TextStyle appbarTextW = GoogleFonts.roboto(
//     textStyle: TextStyle(
//   fontSize: Get.width * 0.04,
//   fontStyle: FontStyle.normal,
//   color: Colors.white,
//   fontWeight: FontWeight.bold,
//   letterSpacing: 0.35,
//   wordSpacing: 3,
// ));

// TextStyle appbarTextB = GoogleFonts.roboto(
//     textStyle: TextStyle(
//   fontSize: Get.width * 0.04,
//   fontStyle: FontStyle.normal,
//   color: Colors.black,
//   fontWeight: FontWeight.bold,
//   letterSpacing: 0.35,
//   wordSpacing: 3,
// ));

// TextStyle headerText(
//         {double fontSize,
//         FontWeight fontWeight,
//         Color color,
//         TextDecoration textDecoration}) =>
//     GoogleFonts.roboto(
//         textStyle: TextStyle(
//       decoration: textDecoration ?? TextDecoration.none,
//       fontSize: fontSize ?? Get.width * 0.04,
//       fontStyle: FontStyle.normal,
//       color: color ?? Colors.black,
//       fontWeight: fontWeight ?? FontWeight.bold,
//       wordSpacing: 3,
//     ));
// TextStyle festivalText({double fontSize, FontWeight fontWeight, Color color}) =>
//     GoogleFonts.aladin(
//         textStyle: TextStyle(
//       fontSize: fontSize ?? Get.width * 0.04,
//       fontStyle: FontStyle.normal,
//       color: color ?? Colors.black,
//       fontWeight: fontWeight ?? FontWeight.bold,
//       wordSpacing: 3,
//     ));

// TextStyle basicText(
//         {Color color,
//         FontWeight fontWeight,
//         double wordSpacing,
//         TextDecoration textDecoration,
//         letterSpacing}) =>
//     GoogleFonts.roboto(
//         textStyle: TextStyle(
//       fontSize: Get.width * 0.03,
//       decoration: textDecoration ?? TextDecoration.none,
//       fontStyle: FontStyle.normal,
//       color: color ?? Colors.black87,
//       fontWeight: fontWeight ?? FontWeight.w700,
//       letterSpacing: letterSpacing ?? 0,
//       wordSpacing: wordSpacing ?? 0,
//     ));

// TextStyle hintText = GoogleFonts.roboto(
//     textStyle: TextStyle(
//   fontSize: Get.width * 0.028,
//   fontStyle: FontStyle.normal,
//   color: Colors.black54,
//   fontWeight: FontWeight.w700,
//   letterSpacing: 0.35,
//   wordSpacing: 3,
// ));

// TextStyle anyBoldText(double fSize, Color colors) => GoogleFonts.roboto(
//         textStyle: TextStyle(
//       fontSize: Get.width * fSize,
//       fontStyle: FontStyle.normal,
//       color: colors,
//       fontWeight: FontWeight.bold,
//       letterSpacing: 0.4,
//       wordSpacing: 3,
//     ));

// // -------------------- Operation Helpers ------------------
// String baseUrl(String segment) {
//   return BASE_URL + segment;
// }

// dynamic toJson(var response) {
//   return jsonDecode(jsonEncode(response));
// }
// // ****************************Storage*********************************

// //get Storage
// final store = new GetStorage();

// //Secure Storage
// Future<void> setStorage(var key, value) async {
//   final storage = new FlutterSecureStorage();
//   await storage.write(key: key, value: value);
// }

// Future<bool> hasKey(String key) async {
//   var value = await getStorage(key);
//   return value == null ? false : true;
// }

// Future<String> getStorage(var key) async {
//   final storage = new FlutterSecureStorage();
//   String value = await storage.read(key: key);
//   return value;
// }

// Future<void> deleteStorage() async {
//   final storage = new FlutterSecureStorage();
//   await storage.deleteAll();
//   await store.erase();
// }
// // ---------------- Customized Button ----------

// class PressButton extends StatefulWidget {
//   PressButton(
//       {Key key,
//       @required this.child,
//       @required this.onPressed,
//       this.color,
//       this.padding,
//       this.splashColor,
//       this.highlightColor,
//       this.shape,
//       this.elevation,
//       this.focusColor,
//       CachedNetworkImage content})
//       : super(key: key);
//   final Function onPressed;
//   final RoundedRectangleBorder shape;
//   final Widget child;
//   final EdgeInsets padding;
//   final Color highlightColor;
//   final Color splashColor;
//   final Color color;
//   final double elevation;
//   final Color focusColor;

//   factory PressButton.icon({
//     Key key,
//     @required Widget icon,
//     @required Widget label,
//     @required Function onPressed,
//     Color color,
//     EdgeInsets padding,
//     RoundedRectangleBorder shape,
//   }) = _PressButtonwithicon;

//   @override
//   _PressButtonState createState() => _PressButtonState();
// }

// class _PressButtonState extends State<PressButton> {
//   @override
//   Widget build(BuildContext context) {
//     return RawMaterialButton(
//       onPressed: widget.onPressed,
//       shape: widget.shape ??
//           RoundedRectangleBorder(borderRadius: BorderRadius.zero),
//       child: widget.child,
//       elevation: widget.elevation ?? 0,
//       padding: widget.padding ?? EdgeInsets.zero,
//       highlightColor: widget.highlightColor,
//       splashColor: widget.splashColor,
//       fillColor: widget.color,
//       focusColor: widget.focusColor,
//     );
//   }
// }

// class _PressButtonwithicon extends PressButton {
//   _PressButtonwithicon({
//     Key key,
//     @required Function onPressed,
//     @required Widget icon,
//     @required Widget label,
//     Color color,
//     EdgeInsets padding,
//     RoundedRectangleBorder shape,
//   }) : super(
//           key: key,
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               icon,
//               SizedBox(width: Get.width * 0.05),
//               label,
//             ],
//           ),
//           onPressed: onPressed,
//           color: color,
//           shape: shape,
//           padding: padding,
//         );
// }

// void urlLauncher(
//     {@required String url,
//     String title,
//     String msg,
//     acceptTitle,
//     var actions}) async {
//   await canLaunchUrlString(url)
//       ? alertMsgDialog(
//           title: title ?? 'Open Link',
//           body: Padding(
//             padding: EdgeInsets.symmetric(
//                 horizontal: Get.width * 0.005, vertical: Get.width * 0.02),
//             child: Text(
//               msg ?? "Are You Sure Want to Open ",
//               textAlign: TextAlign.center,
//               style: headerText(),
//             ),
//           ),
//           actions: actions ??
//               [
//                 PressButton(
//                     child: Text(
//                       "Cancel",
//                       style: anyText(0.03, Colors.red, FontWeight.bold),
//                     ),
//                     onPressed: () {
//                       Get.back();
//                     }),
//                 PressButton(
//                     child: Text(
//                       acceptTitle ?? "Open",
//                       style: anyText(0.03, Colors.blueAccent, FontWeight.bold),
//                     ),
//                     onPressed: () async {
//                       await launchUrlString(url);
//                       Get.back();
//                     })
//               ],
//         )
//       : snackBar(msg: "Error", title: "Unable To Open Link");
// }

// /// Determine the current position of the device.
// ///
// /// When the location services are not enabled or permissions
// /// are denied the `Future` will return an error.
// Future<Position> determinePosition() async {
//   bool serviceEnabled;
//   LocationPermission permission;

//   // Test if location services are enabled.
//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     // Location services are not enabled don't continue
//     // accessing the position and request users of the
//     // App to enable the location services.
//     return Future.error(
//         'Location services are disabled. Please Enable First..!');
//   }
//   permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.deniedForever) {
//       // Permissions are denied forever, handle appropriately.
//       return Future.error(
//           'Location permissions are permanently denied, we cannot request permissions.');
//     }

//     if (permission == LocationPermission.denied) {
//       // Permissions are denied, next time you could try
//       // requesting permissions again (this is also where
//       // Android's shouldShowRequestPermissionRationale
//       // returned true. According to Android guidelines
//       // your App should show an explanatory UI now.
//       return Future.error('Location permissions are denied');
//     }
//   }

//   // When we reach here, permissions are granted and we can
//   // continue accessing the position of the device.
//   return await Geolocator.getCurrentPosition();
// }

// //DateTimeFormat
// String dateTimeFormat(var datetime) {
//   return DateFormat('yyyy-MM-dd HH:mm:ss').format(datetime);
// }
