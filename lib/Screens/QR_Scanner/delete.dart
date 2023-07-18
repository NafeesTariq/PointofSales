// AwesomeDialog(
//   context: context,
//   animType: AnimType.scale,
//   dialogType: DialogType.info,
//   body: SizedBox(
//     height: 520,
//     child: ListView.builder(
//       itemCount: 1,
//       itemBuilder: (context, index) {
//         TextEditingController quantityController = TextEditingController();
//         TextEditingController itemnoteController = TextEditingController();

//         if (test == 1) {
//           return Column(
//             children: [
//               Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 10),
//                     child: Container(
//                       width: MediaQuery.of(context).size.width,
//                       decoration: BoxDecoration(
//                         color: Colors.amber,
//                         borderRadius: BorderRadius.circular(10),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.5),
//                             spreadRadius: 2,
//                             blurRadius: 5,
//                             offset: Offset(0, 3),
//                           ),
//                         ],
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(15.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Sale Price: ${newPrice}',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                             TextFormField(
//                               controller: quantityController,
//                               decoration: InputDecoration(
//                                 labelText: 'Quantity',
//                               ),
//                             ),
//                             TextFormField(
//                               controller: itemnoteController,
//                               decoration: InputDecoration(
//                                 labelText: 'Item Note',
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//             ],
//           );
//         } else {
//           return Column(
//             children: [
//               Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 10),
//                     child: Container(
//                       width: MediaQuery.of(context).size.width,
//                       decoration: BoxDecoration(
//                         color: Colors.amber,
//                         borderRadius: BorderRadius.circular(10),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.5),
//                             spreadRadius: 2,
//                             blurRadius: 5,
//                             offset: Offset(0, 3),
//                           ),
//                         ],
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(15.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Sale Price: ${newPrice}',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//             ],
//           );
//         }
//       },
//     ),
//   ),
//   title: 'This is Ignored',
//   desc: 'This is also Ignored',
// ).show();
