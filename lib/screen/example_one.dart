import 'package:flutter/material.dart';

class ExampleOneScreen extends StatefulWidget {
  const ExampleOneScreen({Key? key}) : super(key: key);

  @override
  State<ExampleOneScreen> createState() => _ExampleOneScreenState();
}

class _ExampleOneScreenState extends State<ExampleOneScreen> {
  double value = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example One'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Slider(
            min: 0,max: 1,
              value: value, onChanged: (val) {
              setState(() {
                print(value);
                value = val;
              });
          }),
          Row(
            children: [
              Expanded(
                child: Container(
                    height: 100,
                    decoration: BoxDecoration(color: Colors.green.withOpacity(value)),
                    child: const Center(child: Text('Container 1'))),
              ),
              Expanded(
                child: Container(
                    height: 100,
                    decoration: BoxDecoration(color: Colors.red.withOpacity(value)),
                    child: const Center(child: Text('Container 2'))),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
