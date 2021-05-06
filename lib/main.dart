import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'detail_activity.dart';

void main() async {
  List _data = await getJSON();

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Real Estate on Mars"),
          backgroundColor: Colors.orange,
        ),
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: _data.length,
            itemBuilder: (BuildContext c, int i) {
              String url = _data[i]['img_src'];
              String id = _data[i]['id'];
              String type = _data[i]['type'];
              int price = _data[i]['price'];
              return MyApp(url, id, type, price);
            },
        ),
      )));
}
class MyApp extends StatefulWidget {
  String url;
  String id;
  String type;
  int price;
  //Constructor
  MyApp(this.url, this.id, this.type,this.price);
  @override
  _MyAppState createState() => _MyAppState(url,id, type, price);
}

class _MyAppState extends State<MyApp> {
  String url;
  String id;
  String type;
  int price;
  //Constructor
  _MyAppState(this.url, this.id, this.type, this.price);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: Center(
          child: Column(
            children: [
              Image.network(url),
              Text('ID : '  + id)
            ],
          ),
        ),
      ),
      onTap: (){
        // Tap to start new activity and passing data
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailActivity(url,type,price),
            ));
      },
    );
  }
}

// Network call
Future<List> getJSON() async {
  String apiUrl = "https://mars.udacity.com/realestate";

  http.Response response = await http.get(apiUrl);

  return json.decode(response.body);
}
