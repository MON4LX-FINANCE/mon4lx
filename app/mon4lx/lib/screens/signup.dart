import 'package:flutter/material.dart';
import 'package:mon4lx/screens/master.dart';
import 'package:mon4lx/shared/pin_code.dart';
import 'package:mon4lx/utils/constants.dart';
import 'package:mon4lx/shared/custom_field.dart';
import 'package:mon4lx/shared/rounded_button.dart';
import 'package:mon4lx/screens/login.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      CustomField(
                        hintText: "Full Name",
                        iconData: Icons.person_outline,
                      ),
                      CustomField(
                        hintText: "Email",
                        iconData: Icons.alternate_email,
                      ),
                      CustomField(
                        hintText: "Mobile Number",
                        iconData: Icons.phone,
                      ),
                      CustomField(
                        hintText: "Password",
                        iconData: Icons.lock_outlined,
                      ),
                      CustomField(
                        hintText: "Confirm Password",
                        iconData: Icons.lock_outlined,
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      RoundedButton(
                        text: "Sign Up",
                        onPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Master()));
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "By Signing up you agree to our terms of service and privacy policy.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: kGreyColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
                            },
                            child: Text(
                              "Log In",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
