import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/count_provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({Key? key}) : super(key: key);

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final counterProvider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(const Duration(seconds: 1), (timer) {
      counterProvider.setCount();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CountProvider>(context, listen: false);
    print('build 1');
    return Scaffold(
      appBar: AppBar(
          title: const Text('Provider Count Example'), centerTitle: true),
      body: Center(
        child: Consumer<CountProvider>(
          builder: (context, value, child) {
            print('Build 2');
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${DateTime.now().hour}:"
                      "${DateTime.now().minute}:"
                      "${DateTime.now().second}",
                  style: const TextStyle(
                    fontSize: 50.0,
                  ),
                ),
                Text(
                  value.count.toString(),
                  style: const TextStyle(fontSize: 50.0),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          counterProvider.setCount();
        },
      ),
    );
  }
}
