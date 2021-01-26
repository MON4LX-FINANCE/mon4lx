import 'package:flutter/material.dart';
import 'package:mon4lx/utils/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function onPress;

  RoundedButton({@required this.text, this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
          height: 50,
          decoration: BoxDecoration(
            gradient: bPrimaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          )),
    );
  }
}
