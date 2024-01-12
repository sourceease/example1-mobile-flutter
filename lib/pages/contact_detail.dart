import 'package:contacts/models/contact_list_model.dart';
import 'package:flutter/material.dart';

class ContactDetail extends StatefulWidget {
  final ContactListModel? data;
  const ContactDetail(this.data, {super.key});

  @override
  State<ContactDetail> createState() => _ContactDetailState();
}

class _ContactDetailState extends State<ContactDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 19,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const Text(
              'Back',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(bottom: 60),
            height: MediaQuery.of(context).size.height / 2.5,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white, // Adjust the color as needed
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const CircleAvatar(
                  radius: 50,
                  child: Text(
                    'A',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  '${widget.data?.fstNm} ${widget.data?.lastNm}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const Text(
                  'New Delhi',
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Phone Number',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      const WidgetSpan(
                          child: Icon(
                            Icons.phone_outlined,
                            size: 18,
                          ),
                          alignment: PlaceholderAlignment.middle),
                      const WidgetSpan(
                        child: SizedBox(width: 4),
                      ),
                      TextSpan(
                        text: widget.data?.phNum ?? '',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Email address',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      const WidgetSpan(
                          child: Icon(
                            Icons.email_outlined,
                            size: 18,
                          ),
                          alignment: PlaceholderAlignment.middle),
                      const WidgetSpan(
                        child: SizedBox(width: 4),
                      ),
                      TextSpan(
                        text: widget.data?.email ?? '',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
