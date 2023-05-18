import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_state_management_course/utils/routes/routes_name.dart';
import 'package:flutter_provider_state_management_course/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userPreferences = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: InkWell(
                onTap: () {
                  userPreferences.remove().then((value) {
                    Navigator.pushNamed(context, RoutesName.login);
                  }).onError((error, stackTrace) {
                    if (kDebugMode) {
                      print(error);
                    }
                  });
                },
                child: const Text('Log out')),
          ),
        ],
      ),
    );
  }
}
