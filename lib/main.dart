import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


   Future<String> getData()async{
     var response = await http.get(
       Uri.encodeFull("http://jsonplaceholder.typicode.com/posts"),
       headers: {
         "Key": "sdkjllvnksjdn",
         "Accept": "application/json"
       }
       );
       

       List data = json.decode(response.body);
       print(data[1]["title"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
              child: RaisedButton(
          child: Text("get Code"),
          onPressed: getData,

        ),
      ),
    );
  }
}
