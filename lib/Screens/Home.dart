import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:package_delivery/Screens/DeliveryDetails.dart';
import 'package:package_delivery/singletons/Userdata.dart';
import 'package:package_delivery/Types/Delivery.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Delivery> list = List();
  bool loading = false;
  @override
  void initState() {
    fetchDelivieris();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Deliveries for ${userData.user}"),
        ),
        body: loading
            ? Center(child: CircularProgressIndicator())
            : ListView.separated(
                separatorBuilder: (context, index) => Divider(height: 2.0),
                itemCount: this.list.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile (
                    contentPadding: EdgeInsets.all(16.0),
                    title: Text(
                      'Parcel at storey ${list[index].etage} Box ${list[index].lockNumber}',
                      style: TextStyle(fontSize: 18.0)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DeliveryDetails(
                            delivery: list[index]
                          )
                        ),
                      );
                    },
                    trailing: Icon(
                      Icons.redeem,
                      color: Colors.green[600],
                      ),
                  );
                  
                },
              ));
  }

  void fetchDelivieris() async {
    setState(() {
      loading = true;
    });
    final response = await http.get(
        'http://app02.dev.nue.schneider-its.net:3001/v1/profile/deliveries',
        headers: {HttpHeaders.authorizationHeader: userData.token});
    setState(() {
      loading = false;
    });
    if (response.statusCode == 200) {
      this.list = (json.decode(response.body)['data'] as List)
          .map((data) => Delivery.fromJson(data))
          .toList();
    } else {
      throw Exception('Failed to load deliveries');
    }
  }
}
