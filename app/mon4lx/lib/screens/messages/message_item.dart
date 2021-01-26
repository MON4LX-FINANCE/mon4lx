import 'package:flutter/material.dart';
import 'package:mon4lx/utils/constants.dart';

class MessageItem extends StatelessWidget {
  final Widget navigateTo;
  final String fullName;
  final String imageUrl;
  final String phoneNo;

  MessageItem(
      {this.navigateTo,
      @required this.fullName,
      @required this.imageUrl,
      this.phoneNo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (navigateTo != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => navigateTo),
          );
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              margin: EdgeInsets.only(
                right: 16,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fullName,
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  phoneNo != null
                      ? Text(
                          phoneNo,
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
            phoneNo == null
                ? Icon(
                    Icons.circle,
                    color: Colors.green,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
