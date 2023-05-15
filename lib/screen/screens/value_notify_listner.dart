import 'package:flutter/material.dart';

class NotifyListenerScreen extends StatelessWidget {
  NotifyListenerScreen({Key? key}) : super(key: key);

  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> toggle = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    print('Build');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('TextField'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
                valueListenable: toggle,
                builder: (context, value, child) {
                  return TextFormField(
                    obscureText: toggle.value,
                    decoration: InputDecoration(
                        suffix: InkWell(
                          onTap: () {
                            toggle.value = !toggle.value;
                            print('Build toggle');
                          },
                          child: Icon(toggle.value
                              ? Icons.visibility
                              : Icons.visibility_off_outlined),
                        ),
                        hintText: 'Password'),
                  );
                }),
            Center(
              child: ValueListenableBuilder(
                  valueListenable: _counter,
                  builder: (context, value, child) {
                    return Text(_counter.value.toString(),
                        style: TextStyle(fontSize: 40));
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _counter.value++;
          print(_counter.value);
        },
      ),
    );
  }
}
