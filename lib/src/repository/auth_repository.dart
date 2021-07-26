import 'package:equatable/equatable.dart';

class AuthUser extends Equatable {
  final String uid;
  final String? email;

  AuthUser(this.uid, this.email);

  @override

  List<Object?> get props => [uid];
}

abstract class AuthRepositoryBase {
  Stream<AuthUser?> get onAuthStateChanged;
  Future<AuthUser> get signInAnonymously;
  Future<void> signOut();
}
