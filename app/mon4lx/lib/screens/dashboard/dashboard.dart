import 'package:flutter/material.dart';
import 'package:mon4lx/screens/dashboard/balance_summary.dart';
import 'package:mon4lx/screens/transactions/transactions_summary.dart';
import 'package:mon4lx/shared/widgets.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar("Dashboard"),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BalanceSummary(),
              Expanded(
                child: TransactionsSummary(),
              ),
            ],
          ),
        ));
  }
}
