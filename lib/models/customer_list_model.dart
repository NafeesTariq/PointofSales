class CustomerListmodel {
  List<Listdata>? customerlistdata;

  CustomerListmodel({this.customerlistdata});

  CustomerListmodel.fromJson(Map<String, dynamic> json) {
    if (json['listdata'] != null) {
      customerlistdata = <Listdata>[];
      json['listdata'].forEach((v) {
        customerlistdata!.add(new Listdata.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customerlistdata != null) {
      data['listdata'] = this.customerlistdata!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Listdata {
  int? customerCode;
  String? name;
  String? urduName;
  String? cityName;
  String? cityUrduName;

  Listdata(
      {this.customerCode,
      this.name,
      this.urduName,
      this.cityName,
      this.cityUrduName});

  Listdata.fromJson(Map<String, dynamic> json) {
    customerCode = json['customerCode'];
    name = json['name'];
    urduName = json['urduName'];
    cityName = json['cityName'];
    cityUrduName = json['cityUrduName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerCode'] = this.customerCode;
    data['name'] = this.name;
    data['urduName'] = this.urduName;
    data['cityName'] = this.cityName;
    data['cityUrduName'] = this.cityUrduName;
    return data;
  }
}
