import 'dart:async';

import 'package:flutter/material.dart';

class WhyProviderScreen extends StatefulWidget {
  const WhyProviderScreen({super.key});

  @override
  State<WhyProviderScreen> createState() => _WhyProviderScreenState();
}

class _WhyProviderScreenState extends State<WhyProviderScreen> {
  int x = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer.periodic(const Duration(seconds: 1), (timer) {
      x++;
      // print(x);
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Build $x');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Why Provider'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "${DateTime.now().hour}:"
                  "${DateTime.now().minute}:"
                  "${DateTime.now().second}",
              style: const TextStyle(
              fontSize: 50.0,
            ),
            ),
          ),
          Center(
            child: Text(
              '$x'.toString(),
              style: const TextStyle(
                fontSize: 50.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
