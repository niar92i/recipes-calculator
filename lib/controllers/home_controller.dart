import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:recipes_calculator/controllers/login_controller.dart';

class HomeController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future logout() async {
    Get.delete<LoginController>();
    await _firebaseAuth.signOut().whenComplete(() =>
    Get.offAllNamed("/login"));
  }
}