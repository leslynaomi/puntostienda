///import 'package:firebase_auth/firebase_auth.dart';
//import 'package:puntotienda/src/repository/auth_repository.dart';

/*class AuthRepository extends AuthRepositoryBase {
  final _firebaseAuth = FirebaseAuth.instance;

  AuthUser? _userFromFirebase(User? user) =>
      user == null ? null : AuthUser(user.uid, user.email);

  @override

  Stream<AuthUser?> get onAuthStateChanged => _firebaseAuth.authStateChanges().asyncMap(_userFromFirebase);

  @override
 // Future<AuthUser?> signInAnonymously()async {
    //final user = await _firebaseAuth.signInAnonymously();
   // return _userFromFirebase(user.user);
  //}

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  
}
*/