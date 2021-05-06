import 'package:flutter/material.dart';

class DetailActivity extends StatefulWidget{
  final String imgurl;
  final String type;
  final int price;
  //Constructor
  DetailActivity(this.imgurl, this.type, this.price);
  @override
  State<StatefulWidget> createState() {
    return DetailUi(imgurl, type, price);
  }
}

class DetailUi extends State<DetailActivity>{
  String imgurl;
  String type;
  int price;
  DetailUi(this.imgurl, this.type, this.price);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
          title: Text("Real Estate on Mars")
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
                child: Image.network(imgurl)),
            Text("For " + type, style: TextStyle(
              fontSize: 30.0
            ),),
            Text("\$"+"$price" +"/month", style: TextStyle(
                fontSize: 30.0
            ),),
          ],
        ),
      ),
    );
  }

}