import 'package:flutter/material.dart';
import 'package:flutter_provider_state_management_course/provider/count_provider.dart';
import 'package:flutter_provider_state_management_course/provider/example_one_provider.dart';
import 'package:provider/provider.dart';

import 'screen/example_one.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CountProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ExampleOneProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ExampleOneScreen(),
      ),
    );
  }
}
