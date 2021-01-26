import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mon4lx/utils/constants.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeField extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType> errorController;
  String currentText = "";
  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 24,
      ),
      child: PinCodeTextField(
        length: 6,
        obscureText: false,
        obscuringCharacter: '*',
        animationType: AnimationType.fade,
        blinkWhenObscuring: true,
        animationDuration: Duration(milliseconds: 300),
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.underline,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 40,
          activeFillColor: hasError ? kPrimaryColor : Colors.white,
        ),
        backgroundColor: Colors.white,
        errorAnimationController: errorController,
        controller: textEditingController,
        keyboardType: TextInputType.number,
        onCompleted: (v) {},
        onChanged: (v) {},
      ),
    );
  }
}
