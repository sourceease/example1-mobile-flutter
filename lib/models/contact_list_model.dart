import 'dart:convert';

List<ContactListModel> contactListModelFromJson(String str) => List<ContactListModel>.from(json.decode(str).map((x) => ContactListModel.fromJson(x)));

String contactListModelToJson(List<ContactListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ContactListModel {
    String? fstNm;
    String? lastNm;
    String? email;
    String? phNum;

    ContactListModel({
        this.fstNm,
        this.lastNm,
        this.email,
        this.phNum,
    });

    factory ContactListModel.fromJson(Map<String, dynamic> json) => ContactListModel(
        fstNm: json["fstNm"],
        lastNm: json["lastNm"],
        email: json["email"],
        phNum: json["phNum"],
    );

    Map<String, dynamic> toJson() => {
        "fstNm": fstNm,
        "lastNm": lastNm,
        "email": email,
        "phNum": phNum,
    };
}
