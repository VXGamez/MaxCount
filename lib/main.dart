//FLUTTER NATIVE
import 'package:flutter/material.dart';

//ROUTES
import 'package:max_count/src/routes/routes.dart';

//PAQUETS INSTALATS
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MaxCount());
}

class MaxCount extends StatefulWidget {
  @override
  _MaxCountState createState() => _MaxCountState();
}

class _MaxCountState extends State<MaxCount> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<InternetConnectionStatus>(
        initialData: InternetConnectionStatus.connected,
        create: (_) => InternetConnectionChecker().onStatusChange,
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Max Count',
            initialRoute: '/',
            routes: getApplicationRoutes()));
  }
}
