import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
  });
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          child: Text(firstName.split("")[0]),
        ),
        const SizedBox(width: 16.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$firstName $lastName',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
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
                    text: phoneNumber,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
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
                    text: email,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
