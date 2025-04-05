import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/model/login_model.dart';
import 'package:movie_app/view/home_view.dart';
import 'package:movie_app/view/sign_up_view.dart';

class LoginViewModel {
  // Netflix'in resmi arka plan görseli ve logosu için sabit URL'ler
  String backgroundImageUrl =
      'https://assets.nflxext.com/ffe/siteui/vlv3/9d3533b2-0e2b-40b2-95e0-ecd7979cc88b/a3873901-5b7c-46eb-b9fa-12ffd1dfe371/TR-tr-20240129-popsignuptwoweeks-perspective_alpha_website_medium.jpg';

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  Future<LoginModel?> login(BuildContext context) async {
    isLoading = true;
    var url = Uri.parse("https://api.escuelajs.co/api/v1/auth/login");
    var res = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": emailController.text,
        "password": passwordController.text,
      }),
    );

    if (res.statusCode == 200 || res.statusCode == 201) {
      var jsonBody = jsonDecode(res.body);
      String token = jsonBody["access_token"];
      isLoading = false;

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeView(token: token)),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Geçersiz Şifre veya Mail!")));
    }
    return null;
  }

  signUpRoute(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpView()),
    );
  }
}
