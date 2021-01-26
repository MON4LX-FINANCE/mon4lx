import 'package:flutter/material.dart';
import 'package:mon4lx/screens/master.dart';
import 'package:mon4lx/utils/constants.dart';
import 'package:mon4lx/shared/custom_field.dart';
import 'package:mon4lx/shared/pin_code.dart';
import 'package:mon4lx/shared/rounded_button.dart';
import 'package:mon4lx/screens/signup.dart';

class Login extends StatelessWidget {
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
                    children: <Widget>[
                      Text(
                        "Log In",
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
                        hintText: "Mobile Number",
                        iconData: Icons.phone,
                      ),
                      CustomField(
                        hintText: "Password",
                        iconData: Icons.lock_outlined,
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      RoundedButton(
                        text: "Log In",
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
                        "Welcome to your access to the simplest way to send and receive money",
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
                            "Do you have an account?",
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
                                      builder: (context) => Signup()));
                            },
                            child: Text(
                              "Sign Up",
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
