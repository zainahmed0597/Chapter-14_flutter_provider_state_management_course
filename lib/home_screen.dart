import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  final int x = 100;
  final String name = 'Xano';

  @override
  Widget build(BuildContext context) {
    print('Build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Tutorials'),
        centerTitle: true,
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[Text('Hello $name! $x'.toString())],
        ),
      ),
    );
  }
}
