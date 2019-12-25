import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_route_test/entity/blog_model.dart';
import 'package:flutter_route_test/publish_blog_page.dart';
import 'package:flutter_route_test/second_test_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: "路由管理"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//博客列表
var blogLists = <BlogModel>[];

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    print('main build');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: <Widget>[
          _buildSettingButton(context),
        ],
      ),
      body: (blogLists == null || blogLists.isEmpty)
          ? _buildEmptyView()
          : _buildBlogListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _publishBlog(context);
        },
        tooltip: '发博客',
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    print('main initState');
  }

  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('main didUpdateWidget');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('main didChangeDependencies');
  }

  @override
  void dispose() {
    super.dispose();
    print('main dispose');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('main deactivate');
  }
}

Widget _buildSettingButton(BuildContext context) {
  return  GestureDetector(
    child: Padding(
        padding: EdgeInsets.only(right: 10),
        child: Icon(
          Icons.settings,
        )),
    onTap: () {
      _navigatorToSetting(context);
    },
  );
}

void _navigatorToSetting(BuildContext context) async {
  var result = await Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) {
    return SecondTestPage();
  },settings: RouteSettings(name:"main",arguments: {"keepAlive":true})));
  print('_navigatorToSetting result:$result');
}

void _publishBlog(BuildContext context) async {
  //MaterialPageRoute 安卓风格 从下往上淡入 退出时相反
  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
//    return SecondTestPage();
    return PublishBlogPage(); //为什么跳转后，会立马打印main build
  }));

//  var reslut = await Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
//    return PublishBlogPage();
////    return PublishBlogPage(blogModel: BlogModel(title:"默认标题",content: "这是默认内容"),);
//  }));
//  print('result:$reslut');

  //CupertinoPageRoute ios风格 进入时动画从右侧往左滑入，退出时相反
//  Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) {
//    return PublishBlogPage();
//  })).then((result){
//  print('result:$result');
//  });

//  Navigator.push(context, PageRouteBuilder(pageBuilder: (BuildContext context,
//      Animation<double> animation, Animation<double> secondaryAnimation) {
//    return PublishBlogPage();
//    return new FadeTransition(
//      //使用渐隐渐入过渡,
//      opacity: animation,
//      child: PublishBlogPage(),
//    );
//  }));
  //PageRouteBuilder
//  Navigator.push(context, PageRouteBuilder(pageBuilder: (BuildContext context,
//      Animation<double> animation, Animation<double> secondaryAnimation) {
//    return new FadeTransition(
//      //使用渐隐渐入过渡,
//      opacity: animation,
//      child: PublishBlogPage(),
//    );
//  }));

  //PageRouteBuilder
//  Navigator.push(
//      context,
//      PageRouteBuilder(pageBuilder: (BuildContext context,
//          Animation<double> animation, Animation<double> secondaryAnimation) {
//        return PublishBlogPage();
//      }, transitionsBuilder: (context, animation, secondaryAnimation, child) {
//        var begin = Offset(0.0, 1.0);
//        var end = Offset.zero;
//        var curve = Curves.easeOutQuart;
//        var tween =
//            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//        return SlideTransition(
//          position: animation.drive(tween),
//          child: child,
//        );
//      }));
}

Widget _buildEmptyView() {
  return Center(
    child: Text("你还没有发表博客，点击按钮发表一编吧"),
  );
}

Widget _buildBlogListView() {
  return ListView.builder(
      itemCount: 100,
      itemBuilder: (BuildContext context, int index) {
        return Text("index:$index");
      });
}
