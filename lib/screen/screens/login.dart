import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

// Provider Start Here
class AuthProvider with ChangeNotifier {
  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void login(String email, String password) async {
    setLoading(true);
    try {
      Response response = await post(Uri.parse('https://reqres.in/api/login'),
          body: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        print('successful');
        setLoading(false);
      } else {
        print('login failed');
        setLoading(false);
      }
    } catch (e) {
      print(e.toString());
      setLoading(false);
    }
  }
}

// Login Screen Start Here
// API Login credential
// ID: eve.holt@reqres.in
// Password: cityslicka
// "token": "QpwL5tke4Pnpja7X4"

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  ValueNotifier<bool> toggle = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            const SizedBox(height: 20),
            ValueListenableBuilder(
                valueListenable: toggle,
                builder: (context, value, child) {
                  return TextFormField(
                    obscureText: toggle.value,
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      suffix: InkWell(
                        onTap: () {
                          toggle.value = !toggle.value;
                          print('Build toggle');
                        },
                        child: Icon(toggle.value
                            ? Icons.visibility
                            : Icons.visibility_off_outlined),
                      ),
                    ),
                  );
                }),
            const SizedBox(height: 50),
            InkWell(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: authProvider.loading
                      ? const SizedBox(
                          height: 15,
                          width: 15,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2.0,
                          ),
                        )
                      : const Text('Login',
                          style: TextStyle(color: Colors.white)),
                ),
              ),
              onTap: () {
                authProvider.login(emailController.text.toString(),
                    passwordController.text.toString());
              },
            ),
          ],
        ),
      ),
    );
  }
}
