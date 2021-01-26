import 'package:flutter/material.dart';
import 'package:mon4lx/screens/transactions/transact_to.dart';
import 'package:mon4lx/shared/bottom_navigation_item.dart';
import 'package:mon4lx/screens/dashboard/dashboard.dart';
import 'package:mon4lx/screens/messages/messages.dart';
import 'package:mon4lx/screens/transactions/transactions.dart';
import 'package:mon4lx/screens/settings/settings.dart';

class Master extends StatefulWidget {
  @override
  _MasterState createState() => _MasterState();
}

class _MasterState extends State<Master> {
  List<bool> bottomNavigationItemStatus = [true, false, false, false, false];

  Widget currentWidgetView;

  @override
  void initState() {
    super.initState();
    setState(() {
      currentWidgetView = Dashboard();
    });
  }

  setCurrentWidgetView(int index) {
    setState(() {
      switch (index) {
        case 0:
          currentWidgetView = Dashboard();
          break;
        case 1:
          currentWidgetView = Transactions();
          break;
        case 2:
          currentWidgetView = TransactTo();
          break;
        case 3:
          currentWidgetView = Messages();
          break;
        case 4:
          currentWidgetView = Settings();
          break;
      }
      bottomNavigationItemStatus = [
        index == 0,
        index == 1,
        index == 2,
        index == 3,
        index == 4,
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 250),
        child: currentWidgetView,
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 80,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: 2,
                color: Colors.grey[300],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BottomNavigationItem(
                        imageUrl: 'assets/icons/tile.png',
                        text: "Dashboard",
                        selected: bottomNavigationItemStatus[0],
                        onPress: () {
                          setCurrentWidgetView(0);
                        }),
                    BottomNavigationItem(
                        imageUrl: 'assets/icons/activity.png',
                        text: "Activity",
                        selected: bottomNavigationItemStatus[1],
                        onPress: () {
                          setCurrentWidgetView(1);
                        }),
                    BottomNavigationItem(
                        imageUrl: 'assets/icons/transfer.png',
                        text: "Transact",
                        selected: bottomNavigationItemStatus[2],
                        onPress: () {
                          setCurrentWidgetView(2);
                        }),
                    BottomNavigationItem(
                        imageUrl: 'assets/icons/chatting.png',
                        text: "Messages",
                        selected: bottomNavigationItemStatus[3],
                        onPress: () {
                          setCurrentWidgetView(3);
                        }),
                    BottomNavigationItem(
                        imageUrl: 'assets/icons/settings.png',
                        text: "Settings",
                        selected: bottomNavigationItemStatus[4],
                        onPress: () {
                          setCurrentWidgetView(4);
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
