import 'package:flutter/material.dart';

class ContactsDetailsPage extends StatefulWidget {
  String name;
  String number;
  String email;
  String address;
  ContactsDetailsPage(
      {super.key,
      required this.name,
      required this.number,
      required this.email,
      required this.address});

  @override
  State<ContactsDetailsPage> createState() => _ContactsDetailsPageState();
}

class _ContactsDetailsPageState extends State<ContactsDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return Column(
          children: [Text(widget.name)],
        );
      }),
    );
  }
}
