import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class FirebaseService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String?> signIn(String email, String password) async {
    UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;
    return user?.uid;
  }

  Future<String?> signUp(String email, String password) async {
    UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;
    return user?.uid;
  }

  Future signOut() async {
      Get.delete<LoginController>();
      await _firebaseAuth.signOut().whenComplete(() =>
          Get.offAllNamed("/login"));
  }
}