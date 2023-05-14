import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  int x = 35;
  final String name = 'Xano';

  @override
  Widget build(BuildContext context) {
    print('Build 1');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Tutorials'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              'My $name! $x'.toString(),
              style: const TextStyle(
                fontSize: 50.0,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          x++;
          print(x);
        },
      ),
    );
  }
}
