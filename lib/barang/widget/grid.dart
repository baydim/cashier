// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class Grids extends StatefulWidget {
//   @override
//   _GridsState createState() => _GridsState();
// }

// class _GridsState extends State<Grids> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         image: DecorationImage(
//           image: ExactAssetImage(
//             "assets/gula.jpg",
//           ),
//           fit: BoxFit.contain,
//         ),
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 5,
//           )
//         ],
//       ),
//       margin: EdgeInsets.all(10),
//       height: Get.width / 2 + 30,
//       child: Stack(
//         children: [
//           Positioned(
//             top: 15,
//             right: 15,
//             child: Container(
//               padding: EdgeInsets.all(5),
//               decoration: BoxDecoration(
//                 color: Colors.black,
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Text(
//                 "20",
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             top: 130,
//             left: 0,
//             right: 0,
//             bottom: 0,
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(20),
//                   bottomRight: Radius.circular(20),
//                 ),
//                 gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [
//                       Colors.transparent,
//                       Colors.black.withOpacity(0.9),
//                     ]),
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: 15,
//             left: 15,
//             right: 15,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Gulaku 1kg",
//                   style: TextStyle(
//                     color: Colors.white,
//                   ),
//                 ),
//                 Text(
//                   "Rp.10.000",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 12,
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// // ResponsiveGridCol(
// //   xs: 6,
// //   md: 3,
// //   sm: 3,
// //   child: Grids(),
// // ),
