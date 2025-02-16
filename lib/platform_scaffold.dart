import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class PlatformScaffold extends StatelessWidget {
  final Widget title;
  final Widget body;

  const PlatformScaffold({required this.title, required this.body, super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(middle: title),
          child: body,
        )
        : Scaffold(appBar: AppBar(title: title), body: body);
  }
}
