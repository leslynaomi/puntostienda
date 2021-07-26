import 'dart:io';

import 'package:puntotienda/src/model/user.dart';

abstract class MyUserRepositoryBase {
  Future<MyUser?> getMyUser();
  Future<void> saveMyUser(MyUser user, File? image);
}
