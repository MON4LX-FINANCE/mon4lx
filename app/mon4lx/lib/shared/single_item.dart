import 'package:flutter/material.dart';
import 'package:mon4lx/utils/constants.dart';

class SingleItem extends StatelessWidget {
  final String fullName;
  final String status;
  final String symbol;
  final String imageUrl;
  final String amount;
  final String convertion;
  final String pshift;

  SingleItem({
    this.fullName,
    this.status,
    this.symbol,
    this.imageUrl,
    this.amount,
    this.convertion,
    this.pshift,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(children: [
        Container(
          width: 50,
          height: 50,
          margin: EdgeInsets.only(right: 16),
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
              Text(
                symbol,
                style: TextStyle(
                  color: kGreyColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
