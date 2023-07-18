import 'dart:convert';


import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:quest/Loca_Services/CheckInternet.dart';
import 'package:quest/models/ChangePasswordModel.dart';
import 'package:quest/models/ItemDetailByCode.dart';
import 'package:quest/models/ItemDetailedByQRScanModel.dart';
import 'package:quest/models/Itemcolorlist_Model.dart';
import 'package:quest/models/ItemsDetailsByItemId.dart';
import 'package:quest/models/LedgerDetailsModel.dart';
import 'package:quest/models/RecoveryModel.dart';
import 'package:quest/models/RightsListModel.dart';
import 'package:quest/models/SaveShopSaleModel.dart';
import 'package:quest/models/SaveStoreTransferModel.dart';
import 'package:quest/models/cashCustomerlistModel.dart';
import 'package:quest/models/customer_list_model.dart';
import 'package:http/http.dart' as http;
import 'package:quest/models/LedgerBalanceModel.dart';
import 'package:quest/models/separate_itemlist.dart';
import 'package:quest/models/warehouseListModel.dart';

import 'package:quest/utils/utils.dart';
import '../models/Salesman_login_model.dart';

class Api_Provider {
  CheckInternet checkInternet = CheckInternet();
  List<CustomerListmodel> _CustomerList = [];
  List<CustomerListmodel> _itemList = [];
  List<ItemModelNew> _newlist = [];

  Future<SaveStoreTransferModel?> SaveStoreTransferAPI({
    required int userID,
    required String remarks,
    required String ReferenceNo,
    required int fromstoreid,
    required int tostoreid,
    required List<Map<String, dynamic>> invoiceDetail,
  }) async {
    String url =
        'http://qadrishopsaleapi.qeperpsol.com/api/Invoice/savestoretransfer?userid=${userID}';
    Get.log(' URL is ${url}');
    var req = {
      'userID': userID,
      'remarks': remarks,
      'refrenceNo': ReferenceNo,
      'invoiceDetail': invoiceDetail,
      'fromWarehouseID': fromstoreid,
      'toWarehouseID': tostoreid,
    };

    var body = jsonEncode(req);

    Get.log("My Body is ${body}");
    Map<String, String> headers = {
      //'accept': '*/*',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiUXVlc3QgVGVzdCBTYWxlc21hbiIsImp0aSI6ImNjMzA5ZGE1LWY2M2UtNGQzMS04YTE1LTlmM2UzZjU1NGZkYSIsImV4cCI6MTcwODk0NDkzMSwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMjAvIiwiYXVkIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMjAvIn0._QYxFcUOaAn_Y5ZSLppRlA53qOjvVhR6yUGz4opR0Xk',
      'Content-Type': 'application/json',
    };
    final response =
        await http.post(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode != 200) {
      Get.log("SAVE SHOP Not HITTED");
      Get.log("${response.statusCode}");
    } else {
      Get.log("${response.body}");
      SaveStoreTransferModel saveStoreTransferModel =
          SaveStoreTransferModel.fromJson(jsonDecode(response.body));

      print(" SAVE sTORE tRANSFER API Ok ${response.statusCode}");
      return saveStoreTransferModel;
    }
  }

  Future<RecoveryModel?> PostRecovery({
    required String voucherNo,
    required String voucherType,
    required String voucherDate,
    required int detailCode,
    required String remarks,
    required String chequeNo,
    required double credit,
    required String insertUpdateDelete,
  }) async {
    String url =
        'http://qadrishopsaleapi.qeperpsol.com/api/Payment/saveupdatepayment';
    var req = {
      'voucherNo': voucherNo,
      'voucherType': voucherType,
      'voucherDate': voucherDate,
      'detailCode': detailCode,
      'remarks': remarks,
      'chequeNo': chequeNo,
      'credit': credit,
      'insertUpdateDelete': insertUpdateDelete,
    };
    var body = jsonEncode(req);
    Get.log('Body is ${body}');
    Map<String, String> headers = {
      //'accept': '*/*',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiUXVlc3QgVGVzdCBTYWxlc21hbiIsImp0aSI6ImNjMzA5ZGE1LWY2M2UtNGQzMS04YTE1LTlmM2UzZjU1NGZkYSIsImV4cCI6MTcwODk0NDkzMSwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMjAvIiwiYXVkIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMjAvIn0._QYxFcUOaAn_Y5ZSLppRlA53qOjvVhR6yUGz4opR0Xk',
      'Content-Type': 'application/json',
    };
    final response =
        await http.post(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode != 200) {
      Get.log('API Not HItted ${response.statusCode}');
    } else {
      RecoveryModel recoveryModel =
          RecoveryModel.fromJson(jsonDecode(response.body));
      Get.log('Return Id ----${recoveryModel.returnId}');
      Get.log('Return Msg-------${recoveryModel.returnMessage}');

      return recoveryModel;
    }
  }

  Future<SaveShopSale?> saveShopSaleAPI({
    required String computerNo,
    required int invoiceType,
    required int detailCode,
    required String cashCustomerName,
    required int exchangeRate,
    required String remarks,
    required double grossTotal,
    required List<Map<String, dynamic>> invoiceDetail,
  }) async {
    String url =
        'http://qadrishopsaleapi.qeperpsol.com/api/Invoice/saveshopsale';
    Get.log(' URL is ${url}');
    var req = {
      'computerNo': computerNo,
      'invoiceType': invoiceType,
      'detailCode': detailCode,
      'cashCustomerName': cashCustomerName,
      'exchangeRate': exchangeRate,
      'remarks': remarks,
      'grossTotal': grossTotal,
      'invoiceDetail': invoiceDetail
    };

    var body = jsonEncode(req);
    Get.log("${body}");
    Map<String, String> headers = {
      //'accept': '*/*',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiUXVlc3QgVGVzdCBTYWxlc21hbiIsImp0aSI6ImNjMzA5ZGE1LWY2M2UtNGQzMS04YTE1LTlmM2UzZjU1NGZkYSIsImV4cCI6MTcwODk0NDkzMSwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMjAvIiwiYXVkIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMjAvIn0._QYxFcUOaAn_Y5ZSLppRlA53qOjvVhR6yUGz4opR0Xk',
      'Content-Type': 'application/json',
    };
    final response =
        await http.post(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode != 200) {
      Get.log("SAVE SHOP Not HITTED");
      Get.log("${response.statusCode}");
    } else {
      Get.log("${response.body}");
      SaveShopSale saveShopSale =
          SaveShopSale.fromJson(jsonDecode(response.body));

      print(" SAVE SHOP API Ok ${response.statusCode}");
      return saveShopSale;
    }
  }

  Future<ChangePasswordModel?> changepass(
      {required int SalesmanID,
      required String oldpassword,
      required String newpassword}) async {
    String url =
        'http://qadrishopsaleapi.qeperpsol.com/api/Password/changepassword?SalesmanID=${SalesmanID}&oldpassword=${oldpassword}&newpassword=${newpassword}';
    var req = {
      'SalesmanID': SalesmanID,
      'oldpassword': oldpassword,
      'newpassword': newpassword
    };
    Get.log('${req}');
    var body = jsonEncode(req);
    Map<String, String> headers = {
      //'accept': '*/*',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiUXVlc3QgVGVzdCBTYWxlc21hbiIsImp0aSI6ImNjMzA5ZGE1LWY2M2UtNGQzMS04YTE1LTlmM2UzZjU1NGZkYSIsImV4cCI6MTcwODk0NDkzMSwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMjAvIiwiYXVkIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMjAvIn0._QYxFcUOaAn_Y5ZSLppRlA53qOjvVhR6yUGz4opR0Xk',
      'Content-Type': 'application/json',
    };

    var response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode != 200) {
      Get.log('--------Error Hitting API---------');
    } else {
      ChangePasswordModel changePasswordModel = ChangePasswordModel.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
      return changePasswordModel;
    }
  }

  Future<Salesman_loginModel?> loginAPI({
    required String username,
    required String password,
  }) async {
    String url =
        "http://qadrishopsaleapi.qeperpsol.com/api/Login/salesmanlogin";
    print(url);
    var req = {'userName': username, 'password': password};
    // var body = jsonDecode(req as Map<String ,dynamic>);
    var body = jsonEncode(req);
    // print('req is $body');

    Map<String, String> headers = {
      //'accept': '*/*',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiUXVlc3QgVGVzdCBTYWxlc21hbiIsImp0aSI6ImNjMzA5ZGE1LWY2M2UtNGQzMS04YTE1LTlmM2UzZjU1NGZkYSIsImV4cCI6MTcwODk0NDkzMSwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMjAvIiwiYXVkIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMjAvIn0._QYxFcUOaAn_Y5ZSLppRlA53qOjvVhR6yUGz4opR0Xk',
      'Content-Type': 'application/json',
    };

    var response =
        await http.post(Uri.parse(url), body: body, headers: headers);

    if (response.statusCode != 200) {
      print("code is ${response.statusCode} and API not hitted");
    } else {
      print("code is ${response.statusCode}");

      Salesman_loginModel salesManLoginModel = Salesman_loginModel.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
      print("Logged In");

      return salesManLoginModel;

      // return salesManLoginModel;
    }
  }

  Future<RightsListModel?> getRightsListFromAPI({required int? id}) async {
    String url =
        'http://qadrishopsaleapi.qeperpsol.com/api/Setup/getrightslist?id=${id}';
    Get.log(url);
    Map<String, String> headers = {
      //'accept': '*/*',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiUXVlc3QgVGVzdCBTYWxlc21hbiIsImp0aSI6ImNjMzA5ZGE1LWY2M2UtNGQzMS04YTE1LTlmM2UzZjU1NGZkYSIsImV4cCI6MTcwODk0NDkzMSwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMjAvIiwiYXVkIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMjAvIn0._QYxFcUOaAn_Y5ZSLppRlA53qOjvVhR6yUGz4opR0Xk',
      'Content-Type': 'application/json',
    };

    final response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode != 200) {
      Get.log('API NOt HItted');
    } else {
      RightsListModel rightsListModel = RightsListModel.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
      Get.log('Length of rightslist : ${rightsListModel.listdata!.length}');
      return rightsListModel;
    }
  }

  Future<ItemColorListModel?> getItemColorListFromAPI({required int id}) async {
    String url =
        'http://qadrishopsaleapi.qeperpsol.com/api/Item/getitemcolorlist/${id}';
    Get.log("Url is ${url}");
    Map<String, String> headers = {
      //'accept': '*/*',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiUXVlc3QgVGVzdCBTYWxlc21hbiIsImp0aSI6ImNjMzA5ZGE1LWY2M2UtNGQzMS04YTE1LTlmM2UzZjU1NGZkYSIsImV4cCI6MTcwODk0NDkzMSwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMjAvIiwiYXVkIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMjAvIn0._QYxFcUOaAn_Y5ZSLppRlA53qOjvVhR6yUGz4opR0Xk',
      'Content-Type': 'application/json',
    };
    final response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode != 200) {
      print("Code is ${response.statusCode}");
    } else {
      print("QR API Status is ${response.statusCode}");
      ItemColorListModel itemColorListModel = ItemColorListModel.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
      Map<String, dynamic> responseMap = itemColorListModel.toJson();
      print("${itemColorListModel.listdata!.length}");
      return itemColorListModel;
    }
  }

  Future<ItemDetailedByQrModel?> getitemDetailbyQR(
      {required String qrcode}) async {
    String url =
        "http://qadrishopsaleapi.qeperpsol.com/api/Item/getitemdetailqrcode?qrcode=${qrcode}";
    Get.log("url is ${url}");
    Map<String, String> headers = {
      //'accept': '*/*',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiUXVlc3QgVGVzdCBTYWxlc21hbiIsImp0aSI6ImNjMzA5ZGE1LWY2M2UtNGQzMS04YTE1LTlmM2UzZjU1NGZkYSIsImV4cCI6MTcwODk0NDkzMSwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMjAvIiwiYXVkIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMjAvIn0._QYxFcUOaAn_Y5ZSLppRlA53qOjvVhR6yUGz4opR0Xk',
      'Content-Type': 'application/json',
    };
    final response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode != 200) {
      print(" Code is ${response.statusCode}");
    } else {
      print("QR API Status is ${response.statusCode}");
      ItemDetailedByQrModel itemDetailedByQrModel =
          ItemDetailedByQrModel.fromJson(
              jsonDecode(response.body) as Map<String, dynamic>);
      Map<String, dynamic> responseMap = itemDetailedByQrModel.toJson();
      print("");
      return itemDetailedByQrModel;
    }
  }

  Future<CashCustomerModel?> getCashCustomerlistFromAPI(
      {required String search}) async {
    String url =
        "http://qadrishopsaleapi.qeperpsol.com/api/Customer/getcashcustomerlist?search=${search}";
    Map<String, String> headers = {
      //'accept': '*/*',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiUXVlc3QgVGVzdCBTYWxlc21hbiIsImp0aSI6ImNjMzA5ZGE1LWY2M2UtNGQzMS04YTE1LTlmM2UzZjU1NGZkYSIsImV4cCI6MTcwODk0NDkzMSwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMjAvIiwiYXVkIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMjAvIn0._QYxFcUOaAn_Y5ZSLppRlA53qOjvVhR6yUGz4opR0Xk',
      'Content-Type': 'application/json',
    };
    final response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode != 200) {
      print(" code is ${response.statusCode}");
    } else {
      CashCustomerModel cashCustomerListModel = CashCustomerModel.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);

      print(" CashCustomer API Ok ${response.statusCode}");

      return cashCustomerListModel;
    }
  }

  Future<WareHouseListModel?> getWareHouseListAPi() async {
    String url =
        'http://qadrishopsaleapi.qeperpsol.com/api/Setup/getwarehouselist';
    Map<String, String> headers = {
      //'accept': '*/*',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiUXVlc3QgVGVzdCBTYWxlc21hbiIsImp0aSI6ImNjMzA5ZGE1LWY2M2UtNGQzMS04YTE1LTlmM2UzZjU1NGZkYSIsImV4cCI6MTcwODk0NDkzMSwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMjAvIiwiYXVkIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMjAvIn0._QYxFcUOaAn_Y5ZSLppRlA53qOjvVhR6yUGz4opR0Xk',
      'Content-Type': 'application/json',
    };
    final response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode != 200) {
      Get.log('Code is ${response.statusCode}');
    } else {
      WareHouseListModel wareHouseListModel = WareHouseListModel.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
      Get.log('Warehouses length is ${wareHouseListModel.listdata!.length}');
      Get.log('Warehouse API HItted...');

      return wareHouseListModel;
    }
  }

  Future<CustomerListmodel?> getCustomerlistFromAPI(
      {required String search}) async {
    String url =
        "http://qadrishopsaleapi.qeperpsol.com/api/Customer/getcreditcustomerlist?search=${search}";
    Map<String, String> headers = {
      //'accept': '*/*',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiUXVlc3QgVGVzdCBTYWxlc21hbiIsImp0aSI6ImNjMzA5ZGE1LWY2M2UtNGQzMS04YTE1LTlmM2UzZjU1NGZkYSIsImV4cCI6MTcwODk0NDkzMSwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMjAvIiwiYXVkIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMjAvIn0._QYxFcUOaAn_Y5ZSLppRlA53qOjvVhR6yUGz4opR0Xk',
      'Content-Type': 'application/json',
    };
    final response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode != 200) {
      print(" code is ${response.statusCode}");
    } else {
      CustomerListmodel customerListModel = CustomerListmodel.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);

      print(" Customer Api Status code is ${response.statusCode}");

      return customerListModel;
    }
  }

  Future<ItemDetailsByIdModel?> getItemDetailsbyId({required int id}) async {
    String url =
        "http://qadrishopsaleapi.qeperpsol.com/api/Item/getitemdetail/${id}";
    Map<String, String> headers = {
      //'accept': '*/*',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiUXVlc3QgVGVzdCBTYWxlc21hbiIsImp0aSI6IjY5YWNkMmMzLTczOGMtNDZjMC04NWY5LWZiOGFiOWE1ZDM3YiIsImV4cCI6MTcwOTA5OTg5MiwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMjAvIiwiYXVkIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMjAvIn0.xnVvnu2jFaBvYUidYf8nHPwwWtXj1Fh1DAWOXaaY74k',
      'Content-Type': 'application/json',
    };
    final response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode != 200) {
      print("code is ${response.statusCode}");
    } else {
      Map<String, dynamic> responseData = jsonDecode(response.body);
      ItemDetailsByIdModel itemDetailsByIdModel =
          ItemDetailsByIdModel.fromJson(responseData);

      // Print the data types of the response body data
      responseData.forEach((key, value) {
        print('$key: ${value.runtimeType}');
      });

      return itemDetailsByIdModel;
    }
  }


    //chnging required 
    Future<GetdetailsbybCodeModel?> getItemDetailsbyCode({required int? id,required int detailedCode}) async {
    String url =
        "http://qadrishopsaleapi.qeperpsol.com/api/Item/getitemdetailbycode?id=${id}&detailcode=${detailedCode}";
    Map<String, String> headers = {
      //'accept': '*/*',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiUXVlc3QgVGVzdCBTYWxlc21hbiIsImp0aSI6IjA4MGFmMDIyLTVlOTYtNDVmNi1hNTI4LWQwZTI4NzhiNWM5YSIsImV4cCI6MTcxNTU3ODE0NiwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMjAvIiwiYXVkIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMjAvIn0.bwbMArxG3XfhPChY7At2bEVNw2xWQYm-yH-7QWmyq_0',
      'Content-Type': 'application/json',
    };
    final response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode != 200) {
      print("code is ${response.statusCode}");
    } else {
      Map<String, dynamic> responseData = jsonDecode(response.body);
      GetdetailsbybCodeModel itemDetailsByCodeModel =
          GetdetailsbybCodeModel.fromJson(responseData);

      // Print the data types of the response body data
      responseData.forEach((key, value) {
        print('$key: ${value.runtimeType}');
      });

      return itemDetailsByCodeModel;
    }
  }

  Future<ItemModelNew?> newgetitemFromAPI({required String search}) async {
    print("Enter in new function");
    String url =
        "http://qadrishopsaleapi.qeperpsol.com/api/Item/getitemlist?search=${search}";
    Map<String, String> headers = {
      //'accept': '*/*',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiUXVlc3QgVGVzdCBTYWxlc21hbiIsImp0aSI6IjY5YWNkMmMzLTczOGMtNDZjMC04NWY5LWZiOGFiOWE1ZDM3YiIsImV4cCI6MTcwOTA5OTg5MiwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMjAvIiwiYXVkIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMjAvIn0.xnVvnu2jFaBvYUidYf8nHPwwWtXj1Fh1DAWOXaaY74k',
      'Content-Type': 'application/json',
    };
    final response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode != 200) {
      print(" code is ${response.statusCode}");
    } else {
      ItemModelNew newlist = ItemModelNew.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);

      print(" New API Code ${response.statusCode}");

      return newlist;
    }
  }

  Future<GetLedgerBalanceModel?> getLedgerBalance(
      {required double detailedCode}) async {
    String url =
        "http://qadrishopsaleapi.qeperpsol.com/api/Ledger/getbalance?detailcode=${detailedCode}";
    Map<String, String> headers = {
      //'accept': '*/*',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiUXVlc3QgVGVzdCBTYWxlc21hbiIsImp0aSI6ImNjMzA5ZGE1LWY2M2UtNGQzMS04YTE1LTlmM2UzZjU1NGZkYSIsImV4cCI6MTcwODk0NDkzMSwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMjAvIiwiYXVkIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMjAvIn0._QYxFcUOaAn_Y5ZSLppRlA53qOjvVhR6yUGz4opR0Xk',
      'Content-Type': 'application/json',
    };
    final response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode != 200) {
      print(" code is ${response.statusCode}");
    } else {
      GetLedgerBalanceModel ledgerBalance = GetLedgerBalanceModel.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);

      print("Ledger Balance API OKKKKKK ${response.statusCode}");

      return ledgerBalance;
    }
  }

  Future<LedgerDetailsModel?> getLedgerDetails(
      {required double detailedCode,
      required String fromDate,
      required String todate}) async {
    String url =
        "http://qadrishopsaleapi.qeperpsol.com/api/Ledger/getledger?detailcode=${detailedCode}&fromdate=${fromDate}&todate=${todate}";
    Map<String, String> headers = {
      //'accept': '*/*',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiUXVlc3QgVGVzdCBTYWxlc21hbiIsImp0aSI6ImNjMzA5ZGE1LWY2M2UtNGQzMS04YTE1LTlmM2UzZjU1NGZkYSIsImV4cCI6MTcwODk0NDkzMSwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMjAvIiwiYXVkIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMjAvIn0._QYxFcUOaAn_Y5ZSLppRlA53qOjvVhR6yUGz4opR0Xk',
      'Content-Type': 'application/json',
    };
    final response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode != 200) {
      print(" code is ${response.statusCode}");
    } else {
      LedgerDetailsModel ledgerdetails = LedgerDetailsModel.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);

      print("Ledger Balance API OKKKKKK ${response.statusCode}");

      return ledgerdetails;
    }
  }
}
