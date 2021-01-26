import 'package:flutter/material.dart';
import 'package:mon4lx/utils/constants.dart';
import 'package:mon4lx/shared/custom_field.dart';
import 'package:mon4lx/screens/transactions/transaction_item.dart';
import 'package:mon4lx/screens/dashboard/option_pill.dart';

class Transactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Transactions",
          style: TextStyle(
            color: kPrimaryColor,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: kPrimaryColor,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: SizedBox(
              height: 24,
              width: 24,
              child: Image.asset(
                "assets/icons/qr_code.png",
                color: kPrimaryColor,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomField(
              hintText: "Name or Mobile Number",
              iconData: Icons.search,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OptionPill(
                  text: "All",
                  selected: true,
                ),
                OptionPill(
                  text: "Payments in",
                  selected: false,
                ),
                OptionPill(
                  text: "Payments out",
                  selected: false,
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Pending",
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
                      "01/06/2021",
                      style: TextStyle(
                        color: kGreyColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TransactionItem(
                      imageUrl: "assets/images/user_0.jpg",
                      fullName: "Alice Akullo",
                      status: "received",
                      amount: "57.01",
                    ),
                    TransactionItem(
                      imageUrl: "assets/images/user_1.jpg",
                      fullName: "Jose Young",
                      status: "sended",
                      amount: "19.63",
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Divider(
                      color: kPrimaryColor,
                      height: 1,
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      "Completed",
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
                      "01/05/2021",
                      style: TextStyle(
                        color: kGreyColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 8,
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
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "12/29/2020",
                      style: TextStyle(
                        color: kGreyColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 8,
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
      ),
    );
  }
}
