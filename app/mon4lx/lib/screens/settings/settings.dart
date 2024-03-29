import 'package:flutter/material.dart';
import 'package:mon4lx/utils/constants.dart';
import 'package:mon4lx/shared/widgets.dart';
import 'package:mon4lx/screens/settings/setting_item.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Settings"),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 16,
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("assets/images/user_0.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Rebecca Lucas",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              SettingItem(
                  title: "Profile Information", iconData: Icons.person_pin),
              SettingItem(title: "KYC", iconData: Icons.person),
              SettingItem(
                  title: "Change PIN", iconData: Icons.enhanced_encryption),
              SettingItem(title: "Security", iconData: Icons.lock),
              SettingItem(title: "Fees", iconData: Icons.money),
              SettingItem(title: "Prepaid Card", iconData: Icons.credit_card),
              SettingItem(
                  title: "Notifications", iconData: Icons.notifications),
              SettingItem(title: "Privacy Policy", iconData: Icons.privacy_tip),
            ],
          ),
        ),
      ),
    );
  }
}
