import 'package:flutter/material.dart';
import 'package:mon4lx/utils/constants.dart';
import 'package:mon4lx/shared/rounded_button.dart';

class Confirmation extends StatelessWidget {
  final bool send;

  Confirmation({@required this.send});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: EdgeInsets.only(right: 24, left: 24, bottom: 24),
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            color: Colors.green,
                            size: 48,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Funds " +
                                (send ? "transfered" : "requested") +
                                " successfully!",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            send ? "Transfered to:" : "Requested from:",
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
                          Text(
                            r"$ 15.74",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    RoundedButton(
                      text: "Done",
                      onPress: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
