import 'package:flutter/material.dart';
import 'package:mon4lx/utils/constants.dart';
import 'package:mon4lx/screens/messages/message_item.dart';

class MessageContact extends StatelessWidget {
  final Widget navigateTo;

  MessageContact({@required this.navigateTo});

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
            "Contacts",
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  MessageItem(
                    navigateTo: navigateTo,
                    imageUrl: "assets/images/user_0.jpg",
                    fullName: "Rebecca Nalule",
                  ),
                  MessageItem(
                    navigateTo: navigateTo,
                    imageUrl: "assets/images/user_1.jpg",
                    fullName: "Bob Kaggwa",
                  ),
                  MessageItem(
                    navigateTo: navigateTo,
                    imageUrl: "assets/images/user_2.jpg",
                    fullName: "Maureen Mulenga",
                  ),
                  MessageItem(
                    navigateTo: navigateTo,
                    imageUrl: "assets/images/user_3.jpg",
                    fullName: "Pheobe Njoroge",
                  ),
                  MessageItem(
                    navigateTo: navigateTo,
                    imageUrl: "assets/images/user_4.jpg",
                    fullName: "Rebecca Lucas",
                  ),
                  MessageItem(
                    navigateTo: navigateTo,
                    imageUrl: "assets/images/user_5.jpg",
                    fullName: "Rebecca Lucas",
                  ),
                  MessageItem(
                    navigateTo: navigateTo,
                    imageUrl: "assets/images/user_6.jpg",
                    fullName: "Rebecca Lucas",
                  ),
                  MessageItem(
                    navigateTo: navigateTo,
                    imageUrl: "assets/images/user_7.jpg",
                    fullName: "Rebecca Lucas",
                  ),
                  MessageItem(
                    navigateTo: navigateTo,
                    imageUrl: "assets/images/user_8.jpg",
                    fullName: "Rebecca Lucas",
                  ),
                  MessageItem(
                    navigateTo: navigateTo,
                    imageUrl: "assets/images/user_9.jpg",
                    fullName: "Rebecca Lucas",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
