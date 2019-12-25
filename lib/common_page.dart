
import 'package:flutter/material.dart';

class CommonPage extends StatefulWidget {

  @override
  State createState() {
    return _CommonState();
  }
}

class _CommonState extends State<CommonPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试页面"),
      ),
      body: Center(
        child: Text("这里什么都没有"),
      ),
    );
  }
}