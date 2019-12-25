import 'package:flutter/material.dart';
import 'package:flutter_route_test/common_page.dart';

class FourthTestPage extends StatefulWidget {
  @override
  State createState() {
    return _FourthTestState();
  }
}

class _FourthTestState extends State<FourthTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第四个页面"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("NavigatorState"),
            onPressed: () {
              var navigatorState = Navigator.of(context);
              print('navigatorState.canPop:${navigatorState.canPop()}');
            },
          ),
          RaisedButton(
            child: Text("popUntil"),
            onPressed: () {
              Navigator.popUntil(context,(Route route){
                print('route$route');
                //到首页时停下，不要销毁首页，
                //如果想整个应用只剩当前页面，可以省略下面逻辑 return route==null; 即可
                if(route?.settings?.name == "/") {
                  return true;
                }
                return false;
              });
            },
          ),
          RaisedButton(
            child: Text('pushAndRemoveUntil'),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (BuildContext context) {
                return CommonPage();
              }), (Route route) {
                //一直关闭，直到首页时停止，停止时，整个应用只有首页和当前页面
                if (route.settings?.name == "/") {
                  return true; //停止关闭
                }
                return false; //继续关闭
                //return route==null; //一直关闭页面，直到全部Route都关闭，效果就是整个应用，只剩下当前页面，按返回键会直接回系统桌面
              });
            },
          ),
        ],
      ),
    );
  }
}
