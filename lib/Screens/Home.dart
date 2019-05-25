import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final String authToken;

  _HomePageState({this.authToken});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your deliveries"),
      ),
      body: Center(
        child: Text("Logged in"),
      ),
    );
  }
}

class DeliveriesResponse {
  final List<Delivery> deliveries;

  DeliveriesResponse({this.deliveries});


}

class Delivery {

}