import 'package:flutter/material.dart';
import 'package:mon4lx/utils/constants.dart';

class CryptoItem extends StatelessWidget {
  final String fullName;
  final String status;
  final String symbol;
  final String imageUrl;
  final String amount;
  final String converting;
  final String convertingSymbol;
  final String pshift;

  CryptoItem({
    this.fullName,
    this.status,
    this.symbol,
    this.imageUrl,
    this.amount,
    this.converting,
    this.convertingSymbol,
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
                symbol,
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              fullName == " "
                  ? SizedBox(
                      height: 1,
                    )
                  : Text(
                      fullName,
                      style: TextStyle(
                        color: kGreyColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              Text(
                converting == " " ? " " : converting,
                style: TextStyle(
                  color: kGreyColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                (status == "priceup" ? "+ " : "- ") + pshift + " %",
                style: TextStyle(
                  color: status == "priceup" ? Colors.green : Colors.red,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                convertingSymbol + " " + amount,
                style: TextStyle(
                  color: kGreyColor,
                  fontSize: 14,
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
