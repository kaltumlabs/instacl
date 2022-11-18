
import 'package:flutter/material.dart';

class webScreenLayout extends StatefulWidget {
  const webScreenLayout({Key? key}) : super(key: key);

  @override
  State<webScreenLayout> createState() => _webScreenLayoutState();
}

class _webScreenLayoutState extends State<webScreenLayout> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("this is Web"),
      ),
    );
  }
}
