// import 'package:flutter/material.dart';
// import 'package:heartrate/pages/result.dart';
// import 'package:heartrate/style.dart';
//
// class Measuring extends StatefulWidget {
//   @override
//   MeasuringView createState() {
//     return MeasuringView();
//   }
// }
//
// class MeasuringView extends State<Measuring> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//           margin: const EdgeInsets.all(30),
//           child: SafeArea(
//               child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text("Measuring...",
//                         style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
//                     Text(_current.toString(),
//                         style: TextStyle(fontSize: 24.0)),
//                   ]
//               ),
//               SizedBox(height: 20),
//               Image(image: AssetImage('assets/images/instruction1.png'), width: 10, height: 10)),
//               Row(
//                 children: [
//                   Image(image: AssetImage('assets/images/1.png')),
//                   Container(
//                     child: Text("Put your phone on the table with the camera lens facing upward.",
//                         style: mainTheme.textTheme.bodyText1),),
//                 ],
//               ),
//               SizedBox(height: 20),
//               Image(image: AssetImage('assets/images/instruction2.png')),
//               Row(
//                 children: [
//                   Image(image: AssetImage('assets/images/2.png'), width: 10, height: 10),
//                   Container(
//                     child:
//                     Text("Place your finger on the camera lens, keep relax, and wait until the flash turned off.",
//                         style: mainTheme.textTheme.bodyText1),
//                   ),
//                 ],
//               ),
//                   ]
//             )
//         )
//         )
//     );
//   }
//
// }