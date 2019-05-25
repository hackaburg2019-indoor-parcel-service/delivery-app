import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:package_delivery/Screens/Home.dart';

class DeliveryDetails extends StatelessWidget {
  final Delivery delivery;

  DeliveryDetails({this.delivery});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery'),
      ),
      body: Center(child: Text('Your delivery details')),
    );
  }
}