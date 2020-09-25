import "package:flutter/material.dart";

import 'anim/counter.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1800));

    animation = new CurvedAnimation(
      parent: controller,
      curve: Curves.fastOutSlowIn,
    )..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text("Animations")),
          body: Center(child: CounterAnimator())
    ));
  }
}

class Demo1 extends StatelessWidget {
  const Demo1({
    Key key,
    @required this.animation,
  }) : super(key: key);

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text("Animation",
            style: TextStyle(fontSize: 19 * animation.value)));
  }
}

class test extends StatelessWidget {
  const test({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("test"),
          centerTitle: true,
          backgroundColor: Colors.amberAccent.shade700,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.email), onPressed: () => print("email"))
          ]),
      backgroundColor: Colors.redAccent.shade100,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightGreen,
          child: Icon(Icons.add),
          onPressed: () {}),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.email), title: Text("email")),
        BottomNavigationBarItem(
            icon: Icon(Icons.email), title: Text("password")),
      ], onTap: (int index) {}),
      body: CounterAnimator(),
    );
  }
}

class Demo extends StatelessWidget {
  const Demo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(alignment: Alignment.topCenter, children: <Widget>[
            Container(
              width: 300,
              height: 200,
              // margin: EdgeInsets.all(50),
              decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.circular(4.5)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        NetworkImage("https://picsum.photos/536/354"),
                  ),
                  Text('lorem'),
                  Text('ipsum'),
                ],
              ),
            )
          ]),
          InkWell(
              child: Text("lorem", style: TextStyle(fontSize: 43)),
              onTap: () {}),
          Scaff(),
          Center(
            child: Text("Test",
                textDirection: TextDirection.rtl,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }
}

class Scaff extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          final snackbar = SnackBar(content: Text("hi"));
          Scaffold.of(context).showSnackBar(snackbar);
        },
        child: Padding(padding: EdgeInsets.all(10), child: Text("hi")));
  }
}
