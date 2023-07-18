class Salesman_loginModel {
  String? token;
  String? beareartoken;
  String? expiration;
  int? salesmanID;
  String? fullName;
  String? cell1;
  String? cell2;
  String? email;
  String? remarks;
  String? cnic;
  String? userName;
  String? status;

  Salesman_loginModel(
      {this.token,
      this.beareartoken,
      this.expiration,
      this.salesmanID,
      this.fullName,
      this.cell1,
      this.cell2,
      this.email,
      this.remarks,
      this.cnic,
      this.userName,
      this.status});

  Salesman_loginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    beareartoken = json['beareartoken'];
    expiration = json['expiration'];
    salesmanID = json['salesmanID'];
    fullName = json['fullName'];
    cell1 = json['cell1'];
    cell2 = json['cell2'];
    email = json['email'];
    remarks = json['remarks'];
    cnic = json['cnic'];
    userName = json['userName'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['beareartoken'] = this.beareartoken;
    data['expiration'] = this.expiration;
    data['salesmanID'] = this.salesmanID;
    data['fullName'] = this.fullName;
    data['cell1'] = this.cell1;
    data['cell2'] = this.cell2;
    data['email'] = this.email;
    data['remarks'] = this.remarks;
    data['cnic'] = this.cnic;
    data['userName'] = this.userName;
    data['status'] = this.status;
    return data;
  }
}
