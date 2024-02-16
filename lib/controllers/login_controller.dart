import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signIn(BuildContext context, bool formKeyValidate) async {
    if (formKeyValidate) {
      try {
        await auth.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Logged In Successfully'),
          ),
        );
        Get.offAllNamed("/home");
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${e.message}'),
          ),
        );
      }
    }
  }

  Future<void> signUp(BuildContext context, bool formKeyValidate) async {
    if (formKeyValidate) {
      try {
        await auth.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Successfully Signed Up'),
          ),
        );
        Get.offAllNamed("/home");
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${e.message}'),
          ),
        );
      }
    }
  }
}