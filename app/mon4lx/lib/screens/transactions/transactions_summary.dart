import 'package:flutter/material.dart';
import 'package:mon4lx/screens/transactions/transactions.dart';
import 'package:mon4lx/utils/constants.dart';
import 'package:mon4lx/screens/transactions/transaction_item.dart';

class TransactionsSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Transactions",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Transactions()),
                  );
                },
                child: Icon(
                  Icons.arrow_forward,
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "01/06/2021",
            style: TextStyle(
              color: kGreyColor,
              fontSize: 14,
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
                  TransactionItem(
                    imageUrl: "assets/images/user_0.jpg",
                    fullName: "Alice Akullo",
                    status: "received",
                    amount: "57.01",
                  ),
                  TransactionItem(
                    imageUrl: "assets/images/user_1.jpg",
                    fullName: "Jose Kaggwa",
                    status: "sended",
                    amount: "19.63",
                  ),
                  TransactionItem(
                    imageUrl: "assets/images/user_2.jpg",
                    fullName: "Janice Najjuma",
                    status: "received",
                    amount: "114.00",
                  ),
                  TransactionItem(
                    imageUrl: "assets/images/user_3.jpg",
                    fullName: "Phoebe Njoroge",
                    status: "received",
                    amount: "70.16",
                  ),
                  TransactionItem(
                    imageUrl: "assets/images/user_4.jpg",
                    fullName: "Monica Geller",
                    status: "received",
                    amount: "44.50",
                  ),
                  TransactionItem(
                    imageUrl: "assets/images/user_5.jpg",
                    fullName: "Rachel Green",
                    status: "sended",
                    amount: "85.50",
                  ),
                  TransactionItem(
                    imageUrl: "assets/images/user_6.jpg",
                    fullName: "Kamila Fros",
                    status: "received",
                    amount: "155.00",
                  ),
                  TransactionItem(
                    imageUrl: "assets/images/user_7.jpg",
                    fullName: "Ross Geller",
                    status: "received",
                    amount: "23.50",
                  ),
                  TransactionItem(
                    imageUrl: "assets/images/user_8.jpg",
                    fullName: "Chandler Bing",
                    status: "received",
                    amount: "11.50",
                  ),
                  TransactionItem(
                    imageUrl: "assets/images/user_9.jpg",
                    fullName: "Yoyi Delirio",
                    status: "received",
                    amount: "36.00",
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
