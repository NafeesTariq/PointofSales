import 'package:get/get.dart';
import 'package:quest/APis/api_providers.dart';
import 'package:quest/models/warehouseListModel.dart';

class WarehouseListController extends GetxController {
  Api_Provider api_provider = Api_Provider();
  WareHouseListModel? warehouselist;

  Future<void> getWarehouseList() async {
    warehouselist = await api_provider.getWareHouseListAPi();
    Get.log('Warehouse API Hit Ok In Controller');
  }

  List<WarehouseInfo> getWarehouseInfo() {
    List<WarehouseInfo> warehouseInfoList = [];

    for (int i = 0; i < warehouselist!.listdata!.length; i++) {
      String? name = warehouselist!.listdata![i].warehouseName;
      int? id = warehouselist!.listdata![i].warehouseId;

      if (name != null && id != null) {
        WarehouseInfo warehouseInfo = WarehouseInfo(name, id);
        warehouseInfoList.add(warehouseInfo);
        Get.log('Warehouse Name: $name, ID: $id');
      }
    }

    return warehouseInfoList;
  }
}

class WarehouseInfo {
  final String name;
  final int id;

  WarehouseInfo(this.name, this.id);
}
