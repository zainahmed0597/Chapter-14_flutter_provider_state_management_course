import 'package:flutter/material.dart';
import 'package:flutter_provider_state_management_course/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
        centerTitle: true,
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: InkWell(
              child: const Text('Click'),
              onTap: (){
                Utils.toastMessage('No internet connection');
                // Navigator.pushNamed(context, RoutesName.home);
              },
            ),
          ),
        ],
      ),
    );
  }
}
