// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:quest/controllers/ItemController.dart';
// import 'package:quest/controllers/RightsListController.dart';
// import 'package:quest/models/RightsListModel.dart';
// import 'package:quest/models/customer_list_model.dart';
// import 'package:quest/models/separate_itemlist.dart';
// import 'package:quest/widgets/customAppbar.dart';

// import '../../controllers/CustomerListController.dart';

// class RightsScreen extends StatefulWidget {
//   RightsScreen();

//   @override
//   State<RightsScreen> createState() => _ItemSearchState();
// }

// class _ItemSearchState extends State<RightsScreen> {
//   // @override
//   // void dispose() {
//   //   Get.find<NewController>().searchtext.clear();
//   //   super.dispose();
//   // }

//   // CustomerListContoller customercontroller = Get.find<CustomerListContoller>();
//   // ItemListController itemcontroller = Get.find<ItemListController>();
//   RightsListController itemcontroller = Get.find<RightsListController>();
//   // TextEditingController search = TextEditingController();

//   TextEditingController search = TextEditingController();
//   List<RightsList> data = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//           title: 'Rights List',
//           onBackButtonPressed: () {
//             Navigator.pop(context);
//           }),
//       body: ListView(
//         children: [
//           Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextFormField(
//                   keyboardType: TextInputType.text,
//                   controller: Get.find<RightsListController>().searchtext,
//                   onChanged: (value) {
//                     itemcontroller.getrightslist(id: 2022);
//                     data.clear();
//                     setState(() {
//                       Get.log("Text is ${itemcontroller.searchtext.text}");
//                       Get.log("DAta is :${data.length}");
//                       data = itemcontroller.rightslist!.listdata!
//                           .where((element) => element.menuName!.contains(RegExp(
//                               itemcontroller.searchtext.text,
//                               caseSensitive: false)))
//                           .toList();
//                       Get.log("After DAta is :${data.length}");
//                     });
//                   },

//                   decoration: InputDecoration(
//                       contentPadding: const EdgeInsets.only(left: 10),
//                       hintText: 'Search',
//                       hintStyle: TextStyle(color: Colors.black),
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8),
//                           borderSide: BorderSide(
//                               color: Colors.black,
//                               width: 1,
//                               style: BorderStyle.solid)),
//                       errorBorder: InputBorder.none,
//                       focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8),
//                           borderSide: BorderSide(
//                               color: Colors.black,
//                               width: 1,
//                               style: BorderStyle.solid)),
//                       enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8),
//                           borderSide: BorderSide(color: Colors.black))),
//                   // controller: controller,
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               SizedBox(
//                 height: 600,
//                 child: Get.find<NewController>().searchtext.text.isNotEmpty
//                     ? ListView.separated(
//                         itemBuilder: (context, index) {
//                           var singleData = data[index];
//                           return Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(5)),
//                               child: Column(
//                                 children: [
//                                   //Text("Item ${index+1}"),
//                                   const SizedBox(
//                                     height: 5,
//                                   ),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text('Menu Name :${singleData.menuName}'),
//                                       // Text("abc"),
//                                     ],
//                                   ),
//                                   const SizedBox(
//                                     height: 5,
//                                   ),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text('User ID : ${singleData.userId}'),
//                                       Text(""),
//                                     ],
//                                   ),
//                                   const SizedBox(
//                                     height: 5,
//                                   ),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text(
//                                           'Show Main  :${singleData.showMain}'),
//                                       Text(""),
//                                     ],
//                                   ),

//                                   const SizedBox(
//                                     height: 5,
//                                   ),
//                                   Center(),
//                                   const SizedBox(
//                                     height: 5,
//                                   ),
//                                   const Divider()
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                         separatorBuilder: (context, index) {
//                           return Divider(
//                             color: Colors.black,
//                             thickness: 1,
//                             height: 1,
//                           );
//                         },
//                         itemCount: data.length)
//                     : ListView.separated(
//                         itemCount:
//                             itemcontroller.rightslist!.listdata?.length ?? 0,
//                         itemBuilder: (context, index) {
//                           var singleData =
//                               itemcontroller.rightslist!.listdata![index];
//                           return Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(5)),
//                               child: Column(
//                                 children: [
//                                   //Text("Item ${index+1}"),
//                                   const SizedBox(
//                                     height: 5,
//                                   ),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text('Menu Name :${singleData.menuName}'),
//                                       // Text("abc"),
//                                     ],
//                                   ),
//                                   const SizedBox(
//                                     height: 5,
//                                   ),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text('User ID : ${singleData.userId}'),
//                                       Text(""),
//                                     ],
//                                   ),
//                                   const SizedBox(
//                                     height: 5,
//                                   ),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text('ShowMain  :${singleData.showMain}'),
//                                       Text(""),
//                                     ],
//                                   ),

//                                   const SizedBox(
//                                     height: 5,
//                                   ),
//                                   const SizedBox(
//                                     height: 5,
//                                   ),
//                                   const Divider()
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                         separatorBuilder: (context, index) {
//                           return Divider(color: Colors.black);
//                         },
//                       ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
