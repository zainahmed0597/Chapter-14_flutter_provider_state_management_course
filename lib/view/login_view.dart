import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_state_management_course/resources/components/round_button.dart';
import 'package:flutter_provider_state_management_course/utils/routes/routes_name.dart';
import 'package:flutter_provider_state_management_course/utils/utils.dart';
import 'package:flutter_provider_state_management_course/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _obscurePassword.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocusNode,
              onFieldSubmitted: (value) {
                Utils.fieldFocusChange(
                    context, emailFocusNode, passwordFocusNode);
              },
              decoration: const InputDecoration(
                hintText: 'Email',
                labelText: 'Email',
                prefixIcon: Icon(Icons.alternate_email),
              ),
            ),
            ValueListenableBuilder(
                valueListenable: _obscurePassword,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    focusNode: passwordFocusNode,
                    obscureText: _obscurePassword.value,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock_open_outlined),
                      suffixIcon: InkWell(
                        child: Icon(_obscurePassword.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility),
                        onTap: () {
                          _obscurePassword.value = !_obscurePassword.value;
                        },
                      ),
                    ),
                  );
                }),
            SizedBox(height: height * .085),
            RoundButton(
                title: 'Login',
                loading: authViewModel.loading,
                onPress: () {
                  if (_emailController.text.isEmpty) {
                    Utils.flushBarErrorMessage('Please enter email', context);
                  } else if (_passwordController.text.isEmpty) {
                    Utils.flushBarErrorMessage(
                        'Please enter password', context);
                  } else if (_passwordController.text.length < 6) {
                    Utils.flushBarErrorMessage(
                        'Please enter 6 digit password', context);
                  } else {
                    Map data = {
                      "email": _emailController.text.toString(),
                      "password": _passwordController.text.toString()
                    };
                    authViewModel.loginApi(data, context);
                    if (kDebugMode) {
                      print('API hit');
                    }

                    // "email": "eve.holt@reqres.in",
                    // "password": "cityslicka"
                  }
                }),
            SizedBox(height: height * .02),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.signUp);
              },
              child: const Text("Don't have an account? Sign up"),),
          ],
        ),
      ),
    );
  }
}
