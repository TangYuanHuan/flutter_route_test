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
            onPressed: (){
              var navigatorState = Navigator.of(context);
              print('navigatorState.canPop:${navigatorState.canPop()}');
            },
          ),
          RaisedButton(
            child: Text('pushAndRemoveUntil'),
            onPressed: (){
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder:(BuildContext context){
                return CommonPage();
              } ), (Route route){
                print('route:$route');
                //
//                if(route.settings!=null && route.settings.arguments is Map) {
//                  var map = route.settings.arguments as Map;
//                  return map.containsKey("keepAlive") && map["keepAlive"];
//                }
//                return false;
                if(route.settings?.name == "/") {
                  return true;
                }
                return false;
//                return route==null; //一直关闭页面，直到全部Route都关闭，效果就是整个应用，只剩下当前页面，按返回键会直接回系统桌面
//                return route==null;
              });
            },
          ),
        ],
      ),
    );
  }
}
