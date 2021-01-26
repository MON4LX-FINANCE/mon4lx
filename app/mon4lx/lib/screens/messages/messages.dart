import 'package:flutter/material.dart';
import 'package:mon4lx/screens/messages/message_contact.dart';
import 'package:mon4lx/shared/widgets.dart';
import 'package:mon4lx/shared/custom_field.dart';
import 'package:mon4lx/shared/recent.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Message Center"),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomField(
              hintText: "Name or Mobile number",
              iconData: Icons.search,
            ),
            Recent(
              navigateTo: null,
            ),
            Expanded(
              child: MessageContact(
                navigateTo: null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
