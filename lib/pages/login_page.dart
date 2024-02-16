import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes_calculator/controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  LoginController loginController = Get.put(LoginController());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.purple, Colors.blue],
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            title: const Text(
              'Login',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          body: Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: loginController.emailController,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontWeight: FontWeight.w100),
                      icon: Icon(
                        Icons.email_outlined,
                        color: Colors.white,
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim().isEmpty) {
                        return 'Veuillez remplir ce champ';
                      } else {
                        return null;
                      }
                    },
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: loginController.passwordController,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontWeight: FontWeight.w100),
                      icon: Icon(
                        Icons.password_outlined,
                        color: Colors.white,
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim().isEmpty) {
                        return 'Veuillez remplir ce champ';
                      } else {
                        return null;
                      }
                    },
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      loginController.signIn(context, _formKey.currentState!.validate());
                    },
                    icon: const Icon(Icons.login_outlined),
                    label: const Text('Sign In'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  OutlinedButton.icon(
                    onPressed: () {
                      loginController.signUp(context, _formKey.currentState!.validate());
                    },
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white)),
                    icon: const Icon(Icons.add_circle_outline_outlined, color: Colors.white),
                    label: const Text('Sign Up', style: TextStyle(color: Colors.white),),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
