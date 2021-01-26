import 'package:flutter/material.dart';
import 'package:mon4lx/utils/constants.dart';
import 'package:mon4lx/shared/recent_item.dart';

class Recent extends StatelessWidget {
  final Widget navigateTo;

  Recent({@required this.navigateTo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent",
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RecentItem(
                navigateTo: navigateTo,
                imageUrl: "assets/images/user_0.jpg",
              ),
              RecentItem(
                navigateTo: navigateTo,
                imageUrl: "assets/images/user_1.jpg",
              ),
              RecentItem(
                navigateTo: navigateTo,
                imageUrl: "assets/images/user_2.jpg",
              ),
              RecentItem(
                navigateTo: navigateTo,
                imageUrl: "assets/images/user_3.jpg",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
