import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class PlatformButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget child;

  const PlatformButton({this.onPressed, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(onPressed: onPressed, child: child)
        : ElevatedButton(onPressed: onPressed, child: child);
  }
}
