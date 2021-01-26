import 'package:flutter/material.dart';
import 'package:mon4lx/screens/request/request_from.dart';
import 'package:mon4lx/shared/contacts.dart';
import 'package:mon4lx/shared/widgets.dart';
import 'package:mon4lx/shared/custom_field.dart';
import 'package:mon4lx/shared/recent.dart';

class Request extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Request Money"),
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
              navigateTo: RequestFrom(),
            ),
            Expanded(
              child: Contacts(
                navigateTo: RequestFrom(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
