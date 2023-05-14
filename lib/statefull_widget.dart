import 'package:flutter/material.dart';

class StateFulWidget extends StatefulWidget {
  const StateFulWidget({super.key});

  @override
  State<StateFulWidget> createState() => _StateFulWidgetState();
}

class _StateFulWidgetState extends State<StateFulWidget> {
  int x = 0;
  final String name = 'Xano';
  @override
  Widget build(BuildContext context) {
    print('Build 3');
    return Scaffold(
      appBar: AppBar(
        title: const Text('StateFul Widget'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(DateTime.now().toString()),
          Container(
            child: Center(
              child: Text(
                'My $name! $x'.toString(),
                style: const TextStyle(
                  fontSize: 50.0,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {});
          x++;
          print(x);
        },
      ),
    );
  }
}
