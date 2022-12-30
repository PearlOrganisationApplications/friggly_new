import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:friggly/contacts/contactdetails.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactList extends StatefulWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  List<Contact> _contacts = [];
  bool _permissionDenied = false;

  bool isLoading = true;
  @override
  void initState() {
    fetchContact();
    super.initState();
  }

  Future fetchContact() async {
    if (!await FlutterContacts.requestPermission(readonly: true)) {
      setState(() {
        _permissionDenied = true;
      });
    } else {
      final contacts = await FlutterContacts.getContacts(
          withPhoto: true, withAccounts: true);
      setState(() {
        _contacts = contacts;
      });
    }

    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Contact",
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (_permissionDenied) {
            return const Center(child: Text('Permission denied'));
          }
          if (_contacts == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
              itemCount: _contacts.length,
              itemBuilder: (context, index) {
                var contact = _contacts[index];
                Uint8List? photos = _contacts[index].photo;
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ContactsDetailsPage(
                          name: contact.displayName,
                          number: contact.phones.first.number,
                          email: contact.emails.first.address,
                          address: contact.addresses.first.address,
                        ),
                      ),
                    );
                  },
                  leading: contact.photo == null
                      ? const CircleAvatar(
                          radius: 25.0,
                          child: Icon(Icons.person),
                        )
                      : CircleAvatar(
                          radius: 25.0,
                          backgroundImage: MemoryImage(photos!),
                        ),
                  title: Text(
                    contact.displayName,
                  ),
                );
              });
        },
      ),
    );
  }
}
