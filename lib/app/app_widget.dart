import 'package:flutter/material.dart';
import 'package:pokemon/app/pages/detail_page.dart';
import 'package:pokemon/app/pages/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon Cards',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(title: 'Pokemon Cards'),
        '/detail': (context) => const DetailPage()
      },
    );
  }
}
