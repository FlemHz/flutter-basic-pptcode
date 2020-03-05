import 'package:flutter/material.dart';
import './home.dart';
import './popular.dart';
import './news.dart';

void main() {
  runApp(FLTabs());
}

class FLTabs extends StatefulWidget {
  @override
  FLTabState createState() => FLTabState();
}

class FLTabState extends State<FLTabs> with SingleTickerProviderStateMixin {
  
  //CODE BARU
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 3); //LENGTH = TOTAL TAB YANG AKAN DIBUAT
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
        appBar: AppBar(
          title: Text('FL Tabs'),
          backgroundColor: Colors.red[800],
          //CODE BARU
          bottom: TabBar(
            controller: controller,
            tabs: <Tab>[
              Tab(icon: Icon(Icons.home),),
              Tab(icon: Icon(Icons.note),),
              Tab(icon: Icon(Icons.poll),),
            ]
          ),
          //END CODE
        ),
        //CODE BARU
        body: TabBarView(
          controller: controller,
          children: <Widget>[
            Home(),
            Popular(),
            News()
          ]
        ),
        //END CODE
      )
    );
  }
}
