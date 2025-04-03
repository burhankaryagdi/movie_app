import 'package:flutter/material.dart';
import 'package:movie_app/view_model/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginViewModel loginViewModel = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.blueGrey,
      title: Text(
        "Login Page",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlutterLogo(size: 200),
          SizedBox(height: 20),
          TextField(
            controller: loginViewModel.emailController,
            decoration: InputDecoration(
              labelText: "Email",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: loginViewModel.passwordController,
            decoration: InputDecoration(
              labelText: "Password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            obscureText: true,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            child: Text("Login"),
            onPressed: () {
              loginViewModel.login(context);
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            child: Text("Sign Up"),
            onPressed: () {
              loginViewModel.signUpRoute(context);
            },
          ),
        ],
      ),
    );
  }
}
