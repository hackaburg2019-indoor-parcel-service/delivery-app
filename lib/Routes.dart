import 'package:flutter/material.dart';
import 'package:package_delivery/Screens/Home.dart';
import 'package:package_delivery/Screens/Login.dart';

class Routes {
  Routes() {
    runApp(new MaterialApp(
      title: "Indoor Parcel App",
      debugShowCheckedModeBanner: false,
      home: new LoginPage(),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/login':
            return new MyCustomRoute(
              builder: (_) => new LoginPage(),
              settings: settings,
            );
          case '/home':
          return new MyCustomRoute(
            builder: (_) => new HomePage(),
            settings: settings,
          );
        }
      },
      theme: ThemeData(
        primaryColor: Colors.green[600],
      )
    ));
  }
}

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({WidgetBuilder builder, RouteSettings settings})
    : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
      if (settings.isInitialRoute) return child;
      return new FadeTransition(opacity: animation, child: child);
    }
}