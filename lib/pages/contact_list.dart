import 'dart:convert';
import 'package:contacts/pages/contact_detail.dart';
import 'package:contacts/widgets/contact_card.dart';
import 'package:http/http.dart' as http;
import 'package:contacts/models/contact_list_model.dart';
import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}

List<ContactListModel> contactList = [];
Future<List<ContactListModel>> getCntcsLst() async {
  var url = 'https://mocki.io/v1/8158a3f7-2dc8-40ef-a181-0d90369f7e92';
  final response = await http.get(Uri.parse(url));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    for (Map i in data) {
      contactList.add(
        ContactListModel.fromJson(i.cast<String, dynamic>()),
      );
    }
    return contactList;
  } else {
    return contactList;
  }
}

class _ContactListState extends State<ContactList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[100],
        title: const Text(
          'Contacts',
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 24, color: Colors.black),
        ),
      ),
      body: FutureBuilder(
        future: getCntcsLst(),
        builder: (context, snapshot) {
          int listLength = snapshot.data?.length ?? 0;
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: listLength,
            itemBuilder: (context, index) {
              return Card(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ContactDetail(snapshot.data?[index]),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ContactCard(
                        email: snapshot.data?[index].email ?? '',
                        firstName: snapshot.data?[index].fstNm ?? '',
                        lastName: snapshot.data?[index].lastNm ?? '',
                        phoneNumber: snapshot.data?[index].phNum ?? ''),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
