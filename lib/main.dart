import 'package:deep_links/servises/context_utility.dart';
import 'package:deep_links/servises/uri_servise.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UniService.init(); // Initialize the URI service

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: ContextUtility.navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(),
      routes: {
        '/initial': (context) => InitialScreen(),
        // '/details': (context) => DetailsScreen(),
      },
    );
  }
}

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('InitialScreen'),
      ),
    );
  }
}
