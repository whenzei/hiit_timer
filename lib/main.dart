import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HIIT Timer',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  TabController tabController;
  int min = 0;
  int sec = 0;

  Widget timer() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
              flex: 6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(
                          bottom: 10.0,
                        ),
                        child: Text("MM")),
                    NumberPicker.integer(
                      initialValue: min,
                      minValue: 0,
                      maxValue: 60,
                      listViewWidth: 60.0,
                      infiniteLoop: true,
                      onChanged: (val) {
                        setState(() {
                          min = val;
                        });
                      },
                    )
                  ]),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(
                          bottom: 10.0,
                        ),
                        child: Text("SS")),
                    NumberPicker.integer(
                      initialValue: sec,
                      minValue: 0,
                      step: 10,
                      maxValue: 60,
                      infiniteLoop: true,
                      listViewWidth: 60.0,
                      onChanged: (val) {
                        setState(() {
                          sec = val;
                        });
                      },
                    )
                  ])
                ],
              )
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    tabController = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HIIT Timer"),
        centerTitle: true,
        bottom: TabBar(
          tabs: <Widget>[Text("Timer"), Text("StopWatch")],
          labelPadding: EdgeInsets.only(
            bottom: 10.0,
          ),
          labelStyle: TextStyle(fontSize: 18.0),
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.orangeAccent,
          controller: tabController,
        ),
      ),
      body: TabBarView(
        children: <Widget>[timer(), Text("StopWatch")],
        controller: tabController,
      ),
    );
  }
}
