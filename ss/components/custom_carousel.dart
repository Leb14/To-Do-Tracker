// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:untitled/ViewModel/item_controller.dart';
//
// class CustomCarousel extends StatelessWidget {
//   final itemController = Get.put(ItemController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       return Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           CarouselSlider(
//             items:
//                 itemController.items.map((item) {
//                   return Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Expanded(
//                         child: Image(
//                           image: AssetImage(item.imageUrl),
//                           height: 70,
//                           fit: BoxFit.fitHeight,
//                         ),
//                       ),
//                       SizedBox(width: 10),
//                       Expanded(child: Text(item.text)),
//                     ],
//                   );
//                 }).toList(),
//             options: CarouselOptions(
//               height: 120,
//               autoPlay: true,
//               enableInfiniteScroll: true,
//               enlargeCenterPage: false,
//               viewportFraction: 1.0,
//               onPageChanged: (index, reason) {
//                 itemController.index.value = index;
//               }
//             ),
//           ),
//           SizedBox(height: 10.0),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children:
//               List.generate(
//                   itemController.items.length,
//                   (index) => Obx(() {
//                     return Container(
//                       width: 5,
//                       height: 5,
//                       margin: EdgeInsets.symmetric(horizontal: 4),
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: itemController.index.value == index
//                             ? Colors.blue
//                             : Colors.grey,
//                       ),
//                     );
//                   })
//               )
//           )
//         ],
//       );
//     });
//   }
// }
