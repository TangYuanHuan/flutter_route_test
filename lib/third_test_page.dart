
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_route_test/fourth_test_page.dart';

class ThirdTestPage extends StatefulWidget {

  @override
  State createState() {
    return _ThirdTestState();
  }
}

class _ThirdTestState extends State<ThirdTestPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第三个界面"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("关闭当前页面并返回结果"),
            onPressed: (){
              //返回的结果并不会被第一个页面接收到
              var navigatorState = Navigator.of(context);
              navigatorState.pop("第三个页面的返回结果");
            },
          ),
          RaisedButton(
            child: Text("跳转到第四个页面"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder:(BuildContext context){
                return FourthTestPage();
              }));
            },
          ),
        ],
      ),
    );
  }
}