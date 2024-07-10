import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/chuck_norris_provider.dart';
import 'screens/chuck_norris_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChuckNorrisProvider()),
      ],
      child: MaterialApp(
        title: 'Chuck Norris Jokes',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ChuckNorrisScreen(),
      ),
    );
  }
}
