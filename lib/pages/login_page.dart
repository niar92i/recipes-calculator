import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipes_calculator/pages/home_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  FirebaseAuth auth = FirebaseAuth.instance;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future<void> signIn(BuildContext context) async {
    if (_formKey.currentState!.validate()) {

      try {
        await auth
            .signInWithEmailAndPassword(
                email: _emailController.text, password: _passwordController.text);

        ScaffoldMessenger.of(context)
            .showSnackBar(
          const SnackBar(
            content: Text('Logged In Successfully'),
          ),
        );
        Navigator.pushReplacementNamed(context, "/home");

      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context)
              .showSnackBar(
            SnackBar(
              content: Text('${e.message}'),
            ),
          );
      }
    }
  }

  Future<void> signUp(BuildContext context) async {
    if (_formKey.currentState!.validate()) {

      try {
        await auth
            .createUserWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text);

        ScaffoldMessenger.of(context)
            .showSnackBar(
          const SnackBar(
            content: Text('Successfully Signed Up'),
          ),
        );
        Navigator.pushReplacementNamed(context, "/home");

      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(
          SnackBar(
            content: Text('${e.message}'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Login'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      icon: Icon(Icons.email_outlined),
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
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      icon: Icon(Icons.password_outlined),
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
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      signIn(context);
                    },
                    icon: const Icon(Icons.login_outlined),
                    label: const Text('Sign In'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  OutlinedButton.icon(
                    onPressed: () {
                      signUp(context);
                    },
                    icon: const Icon(Icons.add_circle_outline_outlined),
                    label: const Text('Sign Up'),
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
