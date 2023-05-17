import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../constants/ColorConstants.dart';
import 'CommonWidgets.dart';

void showCustomDialog(String title, String info) {
  Get.defaultDialog(
    radius: 30,
    contentPadding: EdgeInsets.zero,
    title: title,
    titleStyle: const TextStyle(color: Colors.white),
    backgroundColor: ColorConstants.gray600,
    content: Container(
      width: 45 * 14,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          info,
          style: TextStyle(fontSize: 25, color: ColorConstants.green),
        ),
        GestureDetector(
          onTap: () {
            Clipboard.setData(
              ClipboardData(
                text: info,
              ),
            );
            CommonWidgets.snackBar('Message', 'phoneCopied'.tr);
            // Get.back();
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: ColorConstants.gray450,
                borderRadius: BorderRadius.circular(20)),
            child: Icon(
              Icons.copy,
              color: ColorConstants.green,
            ),
          ),
        )
      ]),
    ),
  );
}

// void showDetailsDialog(String title, String info) {
//   Get.defaultDialog(
//     radius: 30,
//     contentPadding: EdgeInsets.zero,
//     title: title,
//     titleStyle: const TextStyle(color: Colors.white),
//     backgroundColor: ColorConstants.gray600,
//     content: Container(
//       width: 45 * 14,
//       height: 60,
//       child: Stack(
//         children: [
//           Positioned(
//             top: 0,
//             bottom: 0,
//             right: 0,
//             left: 0,
//             child: Container(
//               width: 45 * 10,
//               height: 45,
//               // margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//               child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
//                 Flexible(
//                   child: Text(
//                     info,
//                     style:
//                         TextStyle(fontSize: 20, color: ColorConstants.gray200),
//                   ),
//                 ),
//               ]),
//             ),
//           ),
//           Positioned(
//             top: 10,
//             left: 10,
//             child: GestureDetector(
//               onTap: () {
//                 Get.back();
//               },
//               child: Icon(
//                 Icons.clear,
//                 size: 25,
//                 color: ColorConstants.green,
//               ),
//             ),
//           )
//         ],
//       ),
//     ),
//   );
// }
