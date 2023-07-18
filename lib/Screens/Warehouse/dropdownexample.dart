import 'package:expansion_tile_widget/expansion_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quest/Screens/Warehouse/ScanScreen.dart';
import 'package:quest/controllers/WarehouseListCOntroller.dart';
import 'package:quest/utils/utils.dart';
import 'package:quest/widgets/customAppbar.dart';

class Select extends StatefulWidget {
  final int SalesmanId;
  final String title;

  const Select({Key? key, required this.title, required this.SalesmanId})
      : super(key: key);

  @override
  State<Select> createState() => _SelectState();
}

class _SelectState extends State<Select> {
  WarehouseListController warehouseListCOntroller =
      Get.put<WarehouseListController>(WarehouseListController());

  String SelectedFromStore = '';
  String SelectedToStore = '';
  int fromstoreid = 0;
  int tostoreid = 0; // Added SelectedFromStore variable

  @override
  Widget build(BuildContext context) {
    Get.log('SAlesManID is ${widget.SalesmanId}}');
    List<WarehouseInfo> nameslist = warehouseListCOntroller.getWarehouseInfo();
    Get.log('----------${nameslist}');
    return Scaffold(
      appBar: CustomAppBar(
          title: 'Select Store',
          onBackButtonPressed: () {
            Navigator.pop(context);
          }),
      body: ListView(
        children: [
          Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: InkWell(
                onTap: () {
                  if (SelectedFromStore == '' || SelectedToStore == '') {
                    Utils.flushBarErrorMessage('Please Select Store ', context);
                  } else if (SelectedFromStore == SelectedToStore) {
                    Utils.flushBarErrorMessage(
                        'Do Not Select Same Store ', context);
                  } else {
                    Get.to(() => ScanScreen(
                          fromstoreid: fromstoreid,
                          tostoreid: tostoreid,
                          fromstore: SelectedFromStore,
                          tostore: SelectedToStore,
                        ));
                  }
                },
                child: Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      'Next',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 50, right: 50),
              child: CustomExpansionTileWidget(
                headerTitle: SelectedFromStore.isNotEmpty
                    ? SelectedFromStore
                    : 'From Store', // Use SelectedFromStore variable
                headerDecoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  border: Border.all(color: Colors.blueAccent),
                  color: Colors.yellow,
                ),
                children: fromstoreslist(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
              child: CustomExpansionTileWidget(
                headerTitle:
                    SelectedToStore.isNotEmpty ? SelectedToStore : 'To Store',
                headerDecoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  border: Border.all(color: Colors.blueAccent),
                  color: Colors.yellow,
                ),
                children: toStoreList(),
              ),
            ),
          ]),
        ],
      ),
    );
  }

  List<Widget> fromstoreslist() {
    return warehouseListCOntroller.getWarehouseInfo().map((warehouse) {
      return GestureDetector(
        // Wrap container with GestureDetector
        onTap: () {
          setState(() {
            SelectedFromStore = warehouse.name;
            fromstoreid = warehouse.id;
            // Update SelectedFromStore with the tapped option
          });
        },
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black),
            color: Colors.white,
          ),
          child: Center(
            child: Text(warehouse.name),
          ),
        ),
      );
    }).toList();
  }

  List<Widget> toStoreList() {
    return warehouseListCOntroller.getWarehouseInfo().map((warehouse) {
      return GestureDetector(
        // Wrap container with GestureDetector
        onTap: () {
          setState(() {
            SelectedToStore = warehouse.name;
            tostoreid = warehouse.id;
            // Update SelectedFromStore with the tapped option
          });
        },
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black),
            color: Colors.white,
          ),
          child: Center(
            child: Text(warehouse.name),
          ),
        ),
      );
    }).toList();
  }
}
