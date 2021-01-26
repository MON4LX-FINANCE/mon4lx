import 'package:flutter/material.dart';
import 'package:mon4lx/utils/constants.dart';
import 'package:mon4lx/shared/custom_field.dart';
import 'package:mon4lx/shared/single_item.dart';
import 'package:mon4lx/shared/crypto_item.dart';
import 'package:mon4lx/screens/transactions/transaction_item.dart';
import 'package:mon4lx/screens/dashboard/option_pill.dart';

class Transact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Transact Anything",
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
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomField(
              hintText: "search",
              iconData: Icons.search,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OptionPill(
                    text: "All",
                    selected: true,
                  ),
                  OptionPill(
                    text: "National Currencies",
                    selected: false,
                  ),
                  OptionPill(
                    text: "Cryptos",
                    selected: false,
                  ),
                  OptionPill(
                    text: "Mobile Networks",
                    selected: false,
                  ),
                  OptionPill(
                    text: "Banks",
                    selected: false,
                  ),
                  OptionPill(
                    text: "Stocks",
                    selected: false,
                  ),
                  OptionPill(
                    text: "Metals",
                    selected: false,
                  ),
                ],
              ),
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
                      height: 32,
                    ),
                    Text(
                      "MY ACCOUNTS",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    CryptoItem(
                      pshift: "1.7",
                      imageUrl: "assets/images/USD.png",
                      fullName: "United States Dollar",
                      status: "priceup",
                      symbol: "USD",
                      convertingSymbol: r"$ ",
                      amount: "405.45",
                      converting: "",
                    ),
                    CryptoItem(
                      pshift: "3.7",
                      imageUrl: "assets/images/UGX.png",
                      fullName: "Uganda shilling",
                      status: "priceup",
                      symbol: "UGX",
                      convertingSymbol: "UGX ",
                      amount: "3738",
                      converting: "",
                    ),
                    CryptoItem(
                      pshift: "4.1",
                      imageUrl: "assets/images/bch.png",
                      fullName: " ",
                      converting: "0.000324",
                      convertingSymbol: r"$ ",
                      status: "pricedown",
                      symbol: "BCH",
                      amount: "110.75",
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
                      "CRYPTOCURRENCIES",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    SingleItem(
                      imageUrl: "assets/images/BTC.png",
                      fullName: "Bitcoin",
                      symbol: 'Bitcoin Network',
                    ),
                    SingleItem(
                      imageUrl: "assets/images/stellar.png",
                      fullName: "XML",
                      symbol: 'Stellar Network',
                    ),
                    SingleItem(
                      imageUrl: "assets/images/eth.jpg",
                      fullName: "ETH",
                      symbol: 'Ethereum Network',
                    ),
                    SingleItem(
                      imageUrl: "assets/images/0x.jpg",
                      fullName: "0x",
                      symbol: '0x Protocol',
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
                      "BANKS",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.blue[100],
                            child: Icon(
                              Icons.add,
                              color: kPrimaryColor,
                              textDirection: TextDirection.ltr,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Deposit or transfer funds with 0% fees \n from your bank account",
                            style: TextStyle(
                              color: kGreyColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SingleItem(
                      imageUrl: "assets/images/equity.png",
                      fullName: "EQUITY BANK",
                      symbol: "Connect your account",
                    ),
                    SingleItem(
                      imageUrl: "assets/images/cooperative-bank.png",
                      fullName: "CO-OPERATIVE BANK",
                      symbol: "Connect your account",
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
                      "MOBILE MONEY",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.blue[100],
                            child: Icon(
                              Icons.add,
                              color: kPrimaryColor,
                              textDirection: TextDirection.ltr,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Deposit or transfer funds with 0% fees \n from your mobile money number",
                            style: TextStyle(
                              color: kGreyColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SingleItem(
                      imageUrl: "assets/images/airtel.jpg",
                      fullName: "AIRTEL MONEY",
                      symbol: "Connect your account",
                    ),
                    SingleItem(
                      imageUrl: "assets/images/mtn.png",
                      fullName: "MTN MONEY",
                      symbol: "Connect your account",
                    ),
                    SingleItem(
                      imageUrl: "assets/images/tigo.png",
                      fullName: "TIGO",
                      symbol: "Connect your account",
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
                      "STOCKS",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    CryptoItem(
                      pshift: "4.1",
                      imageUrl: "assets/images/apple.png",
                      fullName: " APPLE INC ",
                      converting: " ",
                      convertingSymbol: r"$ ",
                      status: "pricedown",
                      symbol: "APPL",
                      amount: "13410.75",
                    ),
                    CryptoItem(
                      pshift: "2.38",
                      imageUrl: "assets/images/disney.jpg",
                      fullName: "WALT DISNEY CO.",
                      converting: " ",
                      convertingSymbol: r"$ ",
                      status: "priceup",
                      symbol: "DISNEY",
                      amount: "46.75",
                    ),
                    CryptoItem(
                      pshift: "7.38",
                      imageUrl: "assets/images/google.jpg",
                      fullName: "ALPHABET INC.",
                      converting: " ",
                      convertingSymbol: r"$ ",
                      status: "pricedown",
                      symbol: "ALHBT",
                      amount: "236.75",
                    ),
                    CryptoItem(
                      pshift: "2.38",
                      imageUrl: "assets/images/Amazon.jpg",
                      fullName: "AMAZON IN.",
                      converting: " ",
                      convertingSymbol: r"$ ",
                      status: "priceup",
                      symbol: "AMZN",
                      amount: "7946.75",
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
                      "METALS",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    CryptoItem(
                      pshift: "4.1",
                      imageUrl: "assets/images/apple.png",
                      fullName: " GOLD ",
                      converting: " ",
                      convertingSymbol: r"$ ",
                      status: "pricedown",
                      symbol: "GLD",
                      amount: "13410.75",
                    ),
                    CryptoItem(
                      pshift: "2.38",
                      imageUrl: "assets/images/disney.jpg",
                      fullName: "WALT DISNEY CO.",
                      converting: " ",
                      convertingSymbol: r"$ ",
                      status: "priceup",
                      symbol: "DISNEY",
                      amount: "46.75",
                    ),
                    CryptoItem(
                      pshift: "7.38",
                      imageUrl: "assets/images/google.jpg",
                      fullName: "ALPHABET INC.",
                      converting: " ",
                      convertingSymbol: r"$ ",
                      status: "pricedown",
                      symbol: "ALHBT",
                      amount: "236.75",
                    ),
                    CryptoItem(
                      pshift: "2.38",
                      imageUrl: "assets/images/Amazon.jpg",
                      fullName: "AMAZON IN.",
                      converting: " ",
                      convertingSymbol: r"$ ",
                      status: "priceup",
                      symbol: "AMZN",
                      amount: "7946.75",
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
