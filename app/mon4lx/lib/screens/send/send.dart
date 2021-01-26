import 'package:flutter/material.dart';
import 'package:mon4lx/shared/contacts.dart';
import 'package:mon4lx/shared/widgets.dart';
import 'package:mon4lx/shared/custom_field.dart';
import 'package:mon4lx/shared/recent.dart';
import 'package:mon4lx/screens/send/send_to.dart';

class Send extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Send Money"),
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
              navigateTo: SendTo(),
            ),
            Expanded(
              child: Contacts(
                navigateTo: SendTo(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
