import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:package_delivery/Types/Delivery.dart';
import 'package:intl/intl.dart';

class DeliveryDetails extends StatelessWidget {
  final Delivery delivery;
  DeliveryDetails({this.delivery});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery storey ${delivery.etage} box ${delivery.lockNumber}'),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 40.0),
            Center(
              child: Text (
                'Your parcel has arrived on ${DateFormat("dd.MM.yyyy hh:mm").format(delivery.delivered)}',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            SizedBox(height: 50.0),
            Center(
              child: Text(
                'Pick it up with your code:',
                style: TextStyle( fontSize: 20.0),
              )
            ),
            SizedBox(height: 140.0),
            Center(
              child: Text(
                delivery.token,
                style: TextStyle(
                  fontSize: 50.0,
                  color: Colors.green[600],
                  fontWeight: FontWeight.bold,
                  )
              ),
            )
          ],
        )
      ),
    );
  }
}