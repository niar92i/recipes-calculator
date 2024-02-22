import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes_calculator/services/firebase_service.dart';
import 'package:get_it/get_it.dart';

class LoginController extends GetxController {
  // FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseService _firebaseService = GetIt.I.get<FirebaseService>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signIn(BuildContext context, bool formKeyValidate) async {
    if (formKeyValidate) {
      try {
        var userId = await _firebaseService.signIn(
            emailController.text, passwordController.text);
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

  void signUp(BuildContext context, bool formKeyValidate) async {
    if (formKeyValidate) {
      try {
        await _firebaseService.signUp(
            emailController.text, passwordController.text);
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

// Future<void> signIn(BuildContext context, bool formKeyValidate) async {
//   if (formKeyValidate) {
//     try {
//       await auth.signInWithEmailAndPassword(
//           email: emailController.text, password: passwordController.text);
//       // ScaffoldMessenger.of(context).showSnackBar(
//       //   const SnackBar(
//       //     content: Text('Logged In Successfully'),
//       //   ),
//       // );
//       Get.offAllNamed("/home");
//     } on FirebaseAuthException catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('${e.message}'),
//         ),
//       );
//     }
//   }
// }
//
// Future<void> signUp(BuildContext context, bool formKeyValidate) async {
//   if (formKeyValidate) {
//     try {
//       await auth.createUserWithEmailAndPassword(
//           email: emailController.text, password: passwordController.text);
//       // ScaffoldMessenger.of(context).showSnackBar(
//       //   const SnackBar(
//       //     content: Text('Successfully Signed Up'),
//       //   ),
//       // );
//       Get.offAllNamed("/home");
//     } on FirebaseAuthException catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('${e.message}'),
//         ),
//       );
//     }
//   }
// }
}
