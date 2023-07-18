import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quest/APis/api_providers.dart';
import 'package:quest/models/RightsListModel.dart';

class RightsListController extends GetxController {
  Rx<RightsListModel?> rightslist = Rx<RightsListModel?>(null);
  TextEditingController searchtext = TextEditingController();
  Api_Provider api_provider = Api_Provider();
  RightsListModel? list;

  Future<void> getrightslist({required int id}) async {
    await api_provider.getRightsListFromAPI(id: id).then((value) {
      
      // Filter the list based on "showMain" value
      rightslist.value = filterList(value);
      list = value;
     
      return value;
    }).catchError((error) {
      rightslist.value = null;
    });
  }

  RightsListModel? filterList(RightsListModel? rights) {
    if (rights == null) return null;

    List<RightsList> menuList = rights.listdata ?? [];
    List<RightsList> filteredList =
        menuList.where((item) => item.showMain == 1).toList();

    return RightsListModel(listdata: filteredList);
  }
}















// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:quest/APis/api_providers.dart';
// import 'package:quest/models/RightsListModel.dart';

// class RightsListController extends GetxController {
//   Rx<RightsListModel?> rightslist = Rx<RightsListModel?>(null);
//   TextEditingController searchtext = TextEditingController();
//   Api_Provider api_provider = Api_Provider();

//   void getrightslist({required int id}) {
//     api_provider.getRightsListFromAPI(id: id).then((value) {
//       rightslist.value = value;
//     }).catchError((error) {
//       rightslist.value = null;
//     });
//   }
// }
