import 'package:firebase_auth/firebase_auth.dart';
////eliminar
class AuthService {
  final FirebaseAuth _auth;
  AuthService(this._auth);

  Stream<User?> get authStateChanges => _auth.idTokenChanges();

  Future<String> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "logged In";
    } catch (e) {
      return"logged Out";
    }
  }

  Future<String> signUp(String email, String password) async {
    try {
      
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return "Signed Up";
    } catch (e) {
      return"logged Out";
    }
  }



}
