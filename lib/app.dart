import 'package:flutter/material.dart';
import 'package:metrics_bubble/presentation/routes.dart';
import 'package:metrics_bubble/presentation/views/demo/demo_page.dart';

/// [App] contains main settings of the web page and returns
/// [MaterialApp] with all project specific instructions
class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Webpage',
      initialRoute: Routes.demo,
      routes: <String, Widget Function(BuildContext)>{
        Routes.demo: (BuildContext context) => DemoPage(),
      },
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
