import 'package:flutter/material.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  build(context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[800],
          leading: Icon(Icons.home),
          title: Text('DW Flutter Basic')
        ),
          
        //CODE BARU YANG DITAMBAHKAN
        body: Container(
          margin: EdgeInsets.all(10.0), //CODE BARU UNTUK MENGATUR MARGIN
          child: Column(
            children: <Widget> [
              Row(
                children: <Widget>[
                  Icon(Icons.archive),
                  Text('Artikel Terbaru', style: new TextStyle(fontWeight: FontWeight.bold))
                ]
              ),
              Card(
                child: Column(
                  children: <Widget>[
                    Image.network('https://flutter.io/images/homepage/header-illustration.png'),
                    Text('Belajar Flutter')
                  ]
                ),
              ),
            ]
          )
        )
      	//AKHIR CODE
      )
    );
  }
}
