import 'package:puntotienda/src/model/user.dart';
import 'package:puntotienda/src/provider/firebase_provider.dart';
import 'dart:io';

import 'package:puntotienda/src/repository/my_user_repository.dart';

class MyUserRepository extends MyUserRepositoryBase {
  final provider = FirebaseProvider();
  @override
  Future<MyUser?> getMyUser() => provider.getMyUser();

  @override
  Future<void> saveMyUser(MyUser user, File? image) =>
      provider.saveMyUser(user, image);
}
