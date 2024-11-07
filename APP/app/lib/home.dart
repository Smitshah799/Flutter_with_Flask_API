import 'dart:convert';

import 'package:app/function.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String url = '';
  var data;
  String output = 'Initial Output';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Flask App"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(20))),
                onChanged: (value) {
                  // Work with Real phones or production level code or host app
                  // url = 'http://127.0.0.1:5000/api?query=$value';

                  // Work with emulator
                  url = 'http://10.0.2.2:5000/api?query=$value';
                },
              ),
              MaterialButton(
                  color: Colors.blue,
                  onPressed: () async {
                    data = await fetchdata(url);
                    print(data);
                    var decoded = jsonDecode(data);

                    setState(() {
                      output = decoded['output'];
                    });
                  },
                  child: Text(
                    "Fetch ASCII Value",
                    style: TextStyle(color: Colors.white),
                  )),
              Text(
                "Output: $output",
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}
